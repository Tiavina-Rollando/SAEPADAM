import { Component, OnInit } from '@angular/core';
import { Etablissement } from '../../classes/etablissement';
import { User } from '../../classes/user';
import { Agrement } from '../../classes/agrement';
import { EtablissementService } from '../../services/etablissement.service';
import { UserService } from '../../services/user.service';
import { District, Region } from '../../classes/region';
import { ListRegions } from '../../classes/liste_region';
import { ListDistrict } from '../../classes/districts';
import { Filiere } from '../../classes/filiere';
import { Activity } from '../../classes/activite';
import Swal from 'sweetalert2';
import { NgxSpinnerService } from 'ngx-spinner';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-create-agrement',
  templateUrl: './create-agrement.component.html',
  styleUrl: './create-agrement.component.css'
})
export class CreateAgrementComponent implements OnInit{
  etablissement=new Etablissement;
  user=new User;
  veto=new User;
  agrement=new Agrement;
  etabOk:boolean=false;
  cliOk:boolean=false;
  data:any;
  emails: string[]=[];
  emailFiltred: string[]=[];
  regions:Region[]=ListRegions;
  districts:District[]=ListDistrict;
  regionE!:string;
  districtE!:string;
  filieres!:Filiere[];
  type_activities!:Activity[];
  establishmentExist!:boolean;
  establishements:Etablissement[]=[]
  establishementsFiltred!:Etablissement[]

  ngOnInit(): void {
    this.serviceE.getAllActivities()
     .then(response => {
      this.type_activities=response.data
      })
      .catch((err) => {
        // console.log(err);
      });
   this.serviceE.getAllFilieres()
    .then(response => {
      this.filieres=response.data
      })
      .catch((err) => {
        // console.log(err);
      });

    this.serviceU.findAll()
    .then(response=>{
      // console.table(response.data)
      response.data.forEach((element:any) => {
        this.emails.push(element.email)
        // console.table(this.emails)
      });
    })
  }   

  constructor(
    private serviceE:EtablissementService,
    private serviceU: UserService,
    private spinner: NgxSpinnerService,
    private colorService: ColorService
  ){}

  onVetoChange(){
    if(!this.etablissement.veterinaire){
      this.withVetoInfo = false
    }
  }
  onDistrictChange(){
    const regi = this.regions.find(region => region.district.find(dist=> dist.nom == this.etablissement.district));
    if(regi){
      this.etablissement.region = regi?.nom;
    }
  }

  onRegionChange(){
    const regi = this.regions.find(region => region.nom==this.etablissement.region);
    if(regi){
      this.districts = regi?.district;
    }else{
      this.districts = ListDistrict;
    } 
  }
  etablissementOk(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    this.etabOk=true;
    Swal.fire({
      title: 'Ajouter un compte client?',
      showConfirmButton:true,
      showDenyButton:true,
      confirmButtonText:"Oui",
      denyButtonText:"Non",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then(result=>{
      if(result.isDenied){
        this.cliOk=true;
        this.withClientInfo=false;
        Swal.fire({
          title: 'Ajouter un agrément?',
          showConfirmButton:true,
          showDenyButton:true,
          confirmButtonText:"Oui",
          denyButtonText:"Non",
          confirmButtonColor:`${vert}`,
          denyButtonColor:`${orange}`,
          customClass:{
            confirmButton:'color1',
            denyButton:'color3',
          }
        }).then(resultat=>{
          if(resultat.isDenied){
            this.withAgrement=false;
            this.insertAgrement();
          }
          if(resultat.isConfirmed){
            this.withAgrement=true;
          }
        })
      }
      if(result.isConfirmed){
        this.withClientInfo=true
      }
    })
  }

  etablissementNotOk(){
    this.etabOk=false
  }

  clientOk(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    this.cliOk=true;
    Swal.fire({
      title: 'Ajouter un agrément?',
      showConfirmButton:true,
      showDenyButton:true,
      confirmButtonText:"Oui",
      denyButtonText:"Non",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then(resultat=>{
      if(resultat.isDenied){
        this.withAgrement=false;
        this.insertAgrement();
      }
      if(resultat.isConfirmed){
        this.withAgrement=true;
      }
    })
  }
  
  clientNotOk(){
    if(this.withClientInfo){
      this.cliOk=false;
    }else{
      this.etabOk=false
    }
  }

  addVetoInfo(){
    this.withVetoInfo=!this.withVetoInfo;
  }

  checkInfoVeto:boolean=false;

  onCheckboxChange(event:any){
    this.checkInfoVeto = event.target.checked;
    this.addVetoInfo();
  }

  searchMail(email:string){
    if(email!=""){
      this.emailFiltred = this.emails.filter(item =>
        item.toLowerCase().includes(email.toLowerCase()))  
    }else{
      this.emailFiltred=[]
    }
  }

  setEmail(email:string){
    this.user.email=email;
    this.serviceU.findByEmail(this.user.email)
    .then(response=>{
      if(response.data){
        this.user=response.data;
      }
    })
    .catch((err)=>{
      console.error(err)
    })
    this.emailFiltred=[]
  }
  
  withVetoInfo!:boolean;
  withClientInfo!:boolean;
  withAgrement!:boolean;


  insertAgrement() {
    let vetoPass: string | undefined;
    let userPass: string | undefined;
  
    this.spinner.show();
  
    const vetoPassPromise = this.withVetoInfo ? this.loadPass(this.veto.email) : Promise.resolve(undefined);
    const userPassPromise = this.withClientInfo ? this.loadPass(this.user.email) : Promise.resolve(undefined);
  
    Promise.all([vetoPassPromise, userPassPromise])
      .then(([vetoPassResult, userPassResult]) => {
        vetoPass = vetoPassResult || '';
        userPass = userPassResult || '';
  
        const data = {
          name: this.etablissement.name,
          filiere_id: this.etablissement.filiere_id,
          type_etablissement: this.etablissement.type_etablissement,
          adresse: this.etablissement.adresse,
          region: this.etablissement.region,
          district: this.etablissement.district,
          commune: this.etablissement.commune,
          type_produit: this.etablissement.type_produit,
          type_activite_id: this.etablissement.type_activite_id,
          veterinaire: this.etablissement.veterinaire,
          ...(this.withAgrement ? {
            agrements: {
              numero: this.agrement.numero,
              type_agrement_id: this.agrement.type_agrement_id,
              date_debut: this.agrement.date_debut
            }
          } : {}),
          ...(this.withVetoInfo ? {
            veterinaires: {
              name: this.etablissement.veterinaire,
              email: this.veto.email,
              password: vetoPass,
              tel: this.veto.userinformation.tel,
              address: this.veto.userinformation.address,
              matricule: ""
            }
          } : {}),
          ...(this.withClientInfo ? {
            users: {
              email: this.user.email,
              name: this.user.name,
              password: userPass,
              tel: this.user.userinformation.tel,
              address: this.user.userinformation.address,
              matricule: ""
            }
          } : {})
        };
  
        return this.serviceE.insertWithAgrement(data);
      })
      .then(response => {
        this.spinner.hide();
        if (response.data.status) {
          Swal.fire("Données bien enregistrées", "", "success");
        }
      })
      .catch(err => {
        this.spinner.hide();
        Swal.fire("Une erreur s'est produite!", "", "error");
      });
  }
  
  loadPass(email: string): Promise<string | null> {
    return this.serviceU.sendPass(email)
      .then(response => {
        if (response.data.pass) {
          return response.data.pass.toString();
        }
        return null;
      })
      .catch(error => {
        console.error("Erreur lors de l'envoi du mot de passe :", error);
        return null;
      });
  }
  

}
