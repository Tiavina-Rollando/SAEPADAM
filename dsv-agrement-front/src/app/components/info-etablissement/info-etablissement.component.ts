import { AfterViewInit, Component, Input, NgModule, NgModuleFactory, OnChanges, OnDestroy, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { CommonModule, Location, NgFor } from '@angular/common';
import { Subscription } from 'rxjs';
import { FormsModule, NgForm } from '@angular/forms';
import { ListDistrict } from '../../classes/districts';
import { ListRegions } from '../../classes/liste_region';
import { Region, District } from '../../classes/region';
import { EtablissementService } from '../../services/etablissement.service';
import { Filiere } from '../../classes/filiere';
import Swal from 'sweetalert2';
import { NgxSpinner, NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { AppModule } from '../../app.module';
import { ColorDirective } from '../../directives/color.directive';
import { OnSameUrlNavigation } from '@angular/router';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-info-etablissement',
  standalone:true,
  imports:[
    FormsModule,
    ColorDirective,
    CommonModule
  ],
  templateUrl: './info-etablissement.component.html',
  styleUrl: './info-etablissement.component.css'
})
export class InfoEtablissementComponent implements OnInit {
  
  @Input() object!:string
  @Input() item!:any

  toEdit!:boolean;
  toAddProprio!:boolean;
  toChangeProprio!:boolean;
  withVetInfo!:boolean;
  regions:Region[]=ListRegions;
  districts:District[]=ListDistrict;
  filieres!:Filiere[];
  veto:any;
  user:any;
  emailFiltred:string[]=[];
  emails:string[]=[];
  checkInfoVeto:boolean=false;
  mailS!:string;
  itemData !: any;
  
  constructor(
    private serviceE: EtablissementService,
    private spinner : NgxSpinnerService,
    private location: Location,
    private serviceU: UserService
  ){}

  ngOnInit(): void {
    
    if((this.object=="Agrements")||(this.object=="Agrements supprimés")){
      this.object == "Agrements"
    }
    if((this.object=="Demandes d'agrement")||(this.object=="Demandes d'agrement supprimés")){
      this.object == "Demandes d'agrement"
    }
    
    this.serviceU.findAll()
    .then(response=>{
      // console.table(response.data)
      response.data.forEach((element:any) => {
        this.emails.push(element.email)
        // console.table(this.emails)
      });
    })

    this.serviceE.getAllFilieres()
    .then(response => {
      this.filieres=response.data
    })
    .catch((err) => {
      // console.log(err);
    });
  }
    
  onDistrictChange(){
    const regi = this.regions.find(region => region.district.find(dist=> dist.nom == this.item.district));
    if(regi){
      this.item.region = regi?.nom;
    }
  }
  
  onRegionChange(){
    const regi = this.regions.find(region => region.nom==this.item.region);
    if(regi){
      this.districts = regi?.district;
    }else{
      this.districts = ListDistrict;
    } 
  }
  
  update(): void
  {
    this.toEdit = !this.toEdit;
    if(this.toEdit==false){
      this.withVetInfo=false;
    }
    this.toAddProprio = false;
    this.toChangeProprio = false;
  }
  
  addProprio(): void
  { 
    this.toAddProprio = !this.toAddProprio;
    this.toChangeProprio = false;
    this.toEdit = false;
  }
  
  changeProprio(): void
  {
    this.toChangeProprio = !this.toChangeProprio;
    this.toEdit = false;
    this.toAddProprio = false;
  }
  
  addVeto(){
    this.withVetInfo=!this.withVetInfo
  }
  
  onCheckboxChange(event:any){
    this.checkInfoVeto = event.target.checked;
    this.addVeto()
  }
  
  
  updateEtablissement(){
    this.spinner.show()
    const data = {
      name : this.item.name,
      filiere_id : this.item.filiere_id,
      type_etablissement : this.item.type_etablissement,
      adresse : this.item.adresse,
      region : this.item.region,
      district : this.item.district,
      commune : this.item.commune,
      type_produit : this.item.type_produit,
      type_activite_id : this.item.type_activite_id,
      veterinaire: this.item.veterinaire,
      ...(this.withVetInfo?{
        veterinaires:{
          name:this.item.veterinaire,
          email:this.veto.email,
          password:"password",
          tel:this.veto.tel,
          address:this.veto.address,
          matricule:""
        }
      }:{})
    };
    this.serviceE.update(this.item.id,data)
    .then(response=>{
      if(response.data.status==true){  
        this.spinner.hide()
        Swal.fire("Données bien enregistrées", "", "success");
        this.location.back() 
      }  
    })
    .catch(err=>{
      this.spinner.hide()
      Swal.fire("Une erreur s'est produite!", "", "error");
    });

  }
  
  searchMail(email:string){
    if(email!=""){
      this.emailFiltred = this.emails.filter(item =>
        item.toLowerCase().includes(email.toLowerCase()))  
      }else{
        this.emailFiltred=[]
      }
    }
    
    setEmail(email:string): void{
      this.serviceU.findByEmail(email)
      .then(response=>{
      if(response.data){
        console.log(response.data);
        this.user=response.data;
      }
    })
    .catch((err)=>{
      console.error(err)
    })
    this.emailFiltred=[]
  }
  
  addProprioTo(){
    this.spinner.show()
    const data = {
      users:{
        name:this.user.name,
        email:this.user.email,
        password:"password",
        tel:this.user.userinformation.tel,
        address:this.user.userinformation.address,
        matricule:""
      }
    };
    this.serviceE.addProprio(data,this.item.id)
    .then(response=>{
      if(response.data.status==true){
        this.spinner.hide()
        Swal.fire("Données bien enregistrées", "", "success"); 
        this.location.back()
      }   
    })
    .catch(err=>{
      this.spinner.hide()
      Swal.fire("Une erreur s'est produite!", "", "error");
    })

  }
}
