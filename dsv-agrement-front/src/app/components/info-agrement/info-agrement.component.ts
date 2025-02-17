import { Component, Input, OnInit } from '@angular/core';
import { PdfService } from '../../services/pdf.service';
import Swal from 'sweetalert2';
import { DemandeAgrementService } from '../../services/demande-agrement.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AgrementService } from '../../services/agrement.service';
import { Location } from '@angular/common';
import { NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { ColorDirective } from '../../directives/color.directive';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-info-agrement',
  standalone:true,
  imports:[
    CommonModule,
    FormsModule,
    ColorDirective,
    NgxSpinnerComponent
  ],
  templateUrl: './info-agrement.component.html',
  styleUrl: './info-agrement.component.css'
})
export class InfoAgrementComponent implements OnInit{
  @Input() object!:string
  @Input() withAgrement!:string
  @Input() id!:number
  @Input() item!:any
  @Input() qrcodeUrl!:string
  @Input() demA!:any

  constructor(
    private serviceDemA: DemandeAgrementService,
    private pdfService: PdfService,
    private serviceA: AgrementService,
    private location : Location,
    private spinner : NgxSpinnerService,
    private colorService: ColorService
  ){}

  numero:string=''
  date_debut !: string
  type_agrement_id!:string

  showRemarks:boolean=false
  checkRemark:boolean=false

  toEdit=false
  
  
  ngOnInit(): void { 
    if((this.object=="Agrements")||(this.object=="Agrements supprimés")){
      this.object == "Agrements"
    }
    if((this.object=="Demandes d'agrement")||(this.object=="Demandes d'agrement supprimés")){
      this.object == "Demandes d'agrement"
    }
  }
  
  onCheckboxChange(event:any){
    this.showRemarks = event.target.checked;
  }

  onCheckChange(event:any,id:number){
    this.serviceA.updateRemark(id,event.target.checked)
      .then(()=>{});
  }

  suppression(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title:"Procéder à la suppression?",
      showCancelButton:true,
      showConfirmButton:true,
      confirmButtonText:"Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      cancelButtonText:"Annuler",
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then(result=>{
      if(result.isConfirmed){
        this.serviceA.deleteRemark(id)
        .then(()=>{
        })
      }
    })
  }

  getBg(value:string):any{
    if((value=="Définitif")||(value=="Actif")){
      return { 'background-color': this.colorService.getColor('vert') }
    }
    if((value=="Provisoire")||(value=="Suspendu")){
      return { 'background-color': this.colorService.getColor('jaune') }
    }
    if((value=="Provisoire prolongé")||(value=="Retiré")){
      return { 'background-color': this.colorService.getColor('orange') }
    }
  }
 
  updateAgreement()
  {
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Valider l'enregistrement?",
      showCancelButton: true,
      confirmButtonText: "Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      },
      cancelButtonText:"Annuler"
    }).then((result) => {
      if (result.isConfirmed) {
        this.spinner.show()
        this.serviceA.updateOne(this.item.id,this.item.numero,+this.item.type_agrement_id,this.item.date_debut)
          .then((response:any)=>{
            if(response.data.status==true){
              this.spinner.hide()
              Swal.fire(`Agrement mis à jour avec succès!`, "", "success");
              this.location.back()
            }else{
              this.spinner.hide()
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })            
      }
    })
  }
  editAgreement()
  {
    this.toEdit = !this.toEdit
  }

  retire(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous vraiment le retirer?",
      showCancelButton: true,
      confirmButtonText: "Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      },
      cancelButtonText:"Annuler"
    }).then((result) => {
      if (result.isConfirmed) {
        this.spinner.show()
        this.serviceA.retirer(this.item.id)
          .then((response:any)=>{
            if(response.data.status==true){
              this.spinner.hide()
              Swal.fire(`Agrement bien retiré!`, "", "success");
              this.location.back()
            }else{
              this.spinner.hide()
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })          
      }
    })
  }

  suspend(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous vraiment le suspendre?",
      showCancelButton: true,
      confirmButtonText: "Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      },
      cancelButtonText:"Annuler"
    }).then((result) => {
      if (result.isConfirmed) {
        this.spinner.show()
        this.serviceA.suspendre(this.item.id)
          .then((response:any)=>{
            if(response.data.status==true){
              this.spinner.hide()
              Swal.fire(`Agrement mis en suspension!`, "", "success");
              this.location.back()
            }else{
              this.spinner.hide()
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })      
      }
    })
  }

  activate(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous vraiment le re-activer?",
      showCancelButton: true,
      confirmButtonText: "Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      },
      cancelButtonText:"Annuler"
    }).then((result) => {
      if (result.isConfirmed) {
        this.spinner.show()
        this.serviceA.activer(this.item.id)
          .then((response:any)=>{
            if(response.data.status==true){
              this.spinner.hide()
              Swal.fire(`Agrement mis en activité!`, "", "success");
              this.location.back()
            }else{
              this.spinner.hide()
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })      
      }
    })
  }

  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (file) {
      console.log('Nom du fichier : ', file.name);
      console.log('Taille du fichier : ', file.size);
      console.log('Type du fichier : ', file.type);
      // Vous pouvez envoyer le fichier à un service pour le télécharger ou le traiter ici
    }
  }

  generateAgrementPDF(){
    this.pdfService.generateAgrementPDF()
  }

  agrement(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    if(this.withAgrement=='false'){
      Swal.fire({
        title: `Votre demande est encore pour un agrément provisoire pour débuter.\nContinuez?`,
        showCancelButton: true,
        confirmButtonText: "Oui",
        cancelButtonText: "Annuler",
        confirmButtonColor:`${vert}`,
        denyButtonColor:`${orange}`,
        customClass:{
          confirmButton:'color1',
          denyButton:'color3',
        }
      }).then((result) => {
        if (result.isConfirmed) {
          this.serviceDemA.insert(1,id)
          .then(response=>{
            if(response.data.status==true){
              Swal.fire("Demande d'agrement provisoire", "", "success");
            }else{
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })
        }
      });
    }else{
      Swal.fire({
        title: `Votre demande sera pour un agrément définitif à présent.\nContinuez?`,
        showCancelButton: true,
        confirmButtonText: "Oui",
        cancelButtonText: "Annuler",
        confirmButtonColor:`${vert}`,
        denyButtonColor:`${orange}`,
        customClass:{
          confirmButton:'color1',
          denyButton:'color3',
        }
      }).then((result) => {
        if (result.isConfirmed) {
          this.serviceDemA.insert(2,id)
          .then(response=>{
            if(response.data.status==true){
              Swal.fire("Demande d'agrement définitif", "", "success");
            }else{
              Swal.fire("Une erreur s'est produite", "", "error");
            }
          })
        }
      });
    }
  }
  
}
