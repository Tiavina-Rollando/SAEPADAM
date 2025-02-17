import { Component, Input, input } from '@angular/core';
import { DataService } from '../../services/data.service';
import { Etablissement } from '../../classes/etablissement';
import Swal from 'sweetalert2';
import { Activity } from '../../classes/activite';
import { ListDistrict } from '../../classes/districts';
import { Filiere } from '../../classes/filiere';
import { ListRegions } from '../../classes/liste_region';
import { Region, District } from '../../classes/region';
import { EtablissementService } from '../../services/etablissement.service';
import { UserService } from '../../services/user.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-create-establishment',
  templateUrl: './create-establishment.component.html',
  styleUrl: './create-establishment.component.css'
})
export class CreateEstablishmentComponent {
  @Input() withAgrement:string="no"

  
  data:any  
  etablissement=new Etablissement;
  regions:Region[]=ListRegions;
  districts:District[]=ListDistrict;
  regionE!:string;
  districtE!:string;
  filieres!:Filiere[];
  type_activities!:Activity[];
  emails:string[]=[];
  establishmentExist!:boolean;
  establishements:Etablissement[]=[]
  establishementsFiltred!:Etablissement[]

  constructor(
    private serviceE:EtablissementService,
    private serviceU:UserService,
    private dataService : DataService,
    private spinner: NgxSpinnerService,
    private colorService: ColorService
    ){}

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
  }

  searchEtablissement(name:string){
    if(name!=""){
      this.establishementsFiltred = this.establishements.filter(item =>
        item.name.toLowerCase().includes(name.toLowerCase()))
    }else{
      this.establishementsFiltred=[]
    }
  }

  setEstablishment(name : string){
    this.etablissement.name = name;
    this.serviceE.findByName(this.etablissement.name)
      .then(response=>{
        if(response.data){
          this.etablissement=response.data;
          this.establishmentExist=true;
        }else{
          //Create establishment
          this.establishmentExist=false
        }
      })
      .catch((err)=>{
        console.error(err)
    })
    this.establishementsFiltred = []
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
  
  insertEstablishment(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Insertion de nouveau établissement",
      showCancelButton: true,
      confirmButtonText: "Insérer",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        this.spinner.show()
        this.serviceE.insert(this.etablissement.name,this.etablissement.filiere_id,this.etablissement.type_etablissement,this.etablissement.adresse,this.etablissement.region,this.etablissement.district,this.etablissement.commune,this.etablissement.type_produit,this.etablissement.type_activite_id)
        .then(response => {
          if(response.data.status==true){

            this.spinner.hide()    
            Swal.fire("Sauvegardé!", "", "success"); 
            window.location.reload()
            
          }
        })
        .catch((err) => {
          this.spinner.hide()
          Swal.fire("Une erreur s'est produite lors de la sauvegarde", "", "error");
        });

        setTimeout(()=>{
          this.spinner.hide();
          Swal.fire("Vérifier votre connexion!","","info");
        },3000);
    
      } 
    });
  }
  
}
