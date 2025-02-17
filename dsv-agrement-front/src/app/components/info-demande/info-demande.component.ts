import { Component, Input, NgModule, OnDestroy, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import Swal from 'sweetalert2';
import { DemandeAgrementService } from '../../services/demande-agrement.service';
import { Location,CommonModule } from '@angular/common';
import { Subscription } from 'rxjs';
import { ButtonDirective } from '../../directives/button.directive';
import { AppModule } from '../../app.module';
import { NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { AgrementService } from '../../services/agrement.service';
import { ColorService } from '../../services/color.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-info-demande',
  standalone:true,
  imports:[
    CommonModule,
    FormsModule,
    NgxSpinnerComponent
  ],
  templateUrl: './info-demande.component.html',
  styleUrl: './info-demande.component.css'
})
export class InfoDemandeComponent implements OnInit{
  @Input() object!:string
  @Input() item!:any
  
  constructor(
    private serviceData: DataService,
    private serviceDemA: DemandeAgrementService,
    private location : Location,
    private spinner: NgxSpinnerService,
    private serviceA: AgrementService,
    private colorService: ColorService
  ){}
  
  ngOnInit(): void {
    if((this.object=="Agrements")||(this.object=="Agrements supprimés")){
      this.object == "Agrements"
    }
    if((this.object=="Demandes d'agrement")||(this.object=="Demandes d'agrement supprimés")){
      this.object == "Demandes d'agrement"
    }
  }

  retirerDemA(id:number){
    //
  }

  getBg(value:string):any{
    if((value=="Définitif")||(value=="Accepté")){
      return { 'background-color': this.colorService.getColor('vert') }
    }
    if((value=="Provisoire")||(value=="En cours de traitement")){
      return { 'background-color': this.colorService.getColor('jaune') }
    }
    if((value=="Provisoire prolongé")||(value=="Refusé")){
      return { 'background-color': this.colorService.getColor('orange') }
    }
  }

  refuserDemA(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous refuser cette demande?",
      showCancelButton: true,
      cancelButtonText: "Annuler",
      confirmButtonText: `Oui`,
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        const param={
          status:4,
          numero:'null'
        }
        this.serviceDemA.updateOne(id,param.status,param.numero)
          .then(()=>{
            Swal.fire("Demande d'agrement refusée", "", "error");
            this.location.back()
          })
        }
      })
    }
  examinerDemA(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous procéder à l'examination pour cette entrepise?",
      showCancelButton: true,
      cancelButtonText: "Annuler",
      confirmButtonText: `Oui`,
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        const param={
          status:2,
          numero:'null'
        }
        this.serviceDemA.updateOne(id,param.status,param.numero)
        .then(()=>{
          Swal.fire("Demande d'agrement mise en examen", "", "info");
          this.location.back()
        })        
      }
    })
  }
  validerDemA(id: number) {
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Valider cette demande?",
      showCancelButton: true,
      cancelButtonText: "Annuler",
      confirmButtonText: `Oui`,
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Entrer le numéro d'agrément",
          input: 'text',
          inputAttributes: {
            autocapitalize: 'off'
          },
          showCancelButton: true,
          confirmButtonText: 'Valider',
          confirmButtonColor:`${vert}`,
          denyButtonColor:`${orange}`,
          showLoaderOnConfirm: true,
          customClass:{
            confirmButton:'color1',
            denyButton:'color3',
          },
          preConfirm: (numero) => {
            if (!numero) {
              Swal.showValidationMessage(
                'Le numéro d\'agrément est requis'
              );
              return false;
            }
            return { numero };
          },
          allowOutsideClick: () => !Swal.isLoading()
        }).then((inputResult:any) => {
          if (inputResult.isConfirmed) {
            Swal.fire({
              title: "Voulez-vous ajouter des remarques à propos de l'établissement?",
              showCancelButton: true,
              showDenyButton: true,
              cancelButtonText: "Annuler",
              confirmButtonText: `Oui`,
              confirmButtonColor:`${vert}`,
              denyButtonColor:`${orange}`,
              denyButtonText: `Non`,
              customClass:{
                confirmButton:'color1',
                denyButton:'color3',
              }
            }).then(result=>{
              if(result.isDenied){
                this.accepter(id,inputResult.value.numero,false);
              }
              if(result.isConfirmed){
                this.accepter(id,inputResult.value.numero,true);
              }
            })      
          }
        });
      }
    });
  }

  addTaskInput() {
      const taskContainer = document.getElementById('task-container');
      if(taskContainer){
        const taskCount = taskContainer.children.length + 1;
        const newTaskInput = document.createElement('input');
        newTaskInput.type = 'text';
        newTaskInput.id = `task-${taskCount}`;
        newTaskInput.className = 'swal2-input';
        newTaskInput.placeholder = 'Saisissez par ici';
        taskContainer.appendChild(newTaskInput);
      }
    }

  accepter(id:number,numero:any,withRemark:boolean){
    this.spinner.show()
    const param = {
      status: 3,
      numero : numero
    };
    this.serviceDemA.updateOne(id,param.status,param.numero) // Passer le numéro en plus
      .then(response => {
        this.spinner.hide();
        if(withRemark==true){
          let vert = this.colorService.getColor('vert');
          let orange = this.colorService.getColor('orange')
          Swal.fire({
            title: 'Ajouter votre liste de remarques sur l\'établissement:',
            html: `
                <div id="task-container">
                    <input type="text" id="task-1" class="swal2-input" placeholder="Saisissez par ici">
                </div>
                <button type="button" id="add-task-button" class="swal2-confirm swal2-styled">+</button>
            `,
            focusConfirm: false,
            customClass:{
              confirmButton:'color1',
              denyButton:'color3',
            },
            confirmButtonColor:`${vert}`,
            denyButtonColor:`${orange}`,
            preConfirm: () => {
                const tasks:any = [];
                const taskInputs = document.querySelectorAll('#task-container input');
                taskInputs.forEach((input:any) => {
                    if (input.value.trim() !== "") {
                        tasks.push(input.value.trim());
                    }
                });
                if (tasks.length === 0) {
                    Swal.showValidationMessage('Entrer au moins une!');
                }
                return tasks;
            }
          }).then((result) => {
              if (result.isConfirmed) {
                this.spinner.show();
                result.value.forEach((task:string) => {
                  this.serviceA.addRemark(response.data.id,task)
                    .then(()=>{      
                      this.spinner.hide();
                      Swal.fire("Demande d'agrément acceptée", "", "success");
                      this.location.back();
                    })  
                });
              }
          });
    
          const boutton=document.getElementById('add-task-button')
          if(boutton){boutton.addEventListener('click', this.addTaskInput)};
        
        }else{
            
          Swal.fire("Demande d'agrément acceptée", "", "success");
          this.location.back();
        }
      })
      .catch((error) => {
        this.spinner.hide()
        Swal.fire("Erreur", "Une erreur s'est produite lors de la mise à jour de la demande", "error");
      });
  }
}
