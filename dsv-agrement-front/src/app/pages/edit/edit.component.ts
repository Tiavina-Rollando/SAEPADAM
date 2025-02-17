import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { UserService } from '../../services/user.service';
import { NgxSpinner, NgxSpinnerService } from 'ngx-spinner';
import { ColorService } from '../../services/color.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrl: './edit.component.css'
})
export class EditComponent implements OnInit {
  user:any
  newUser={
    tel:""
  }

  constructor(
    private serviceU : UserService,
    private spinner: NgxSpinnerService,
    private colorService: ColorService,
    private activatedRoute : ActivatedRoute
  ){}
  
  ngOnInit(): void {
    try{
      if(this.activatedRoute){
        this.activatedRoute.paramMap.subscribe((params:ParamMap)=>{
          let userId = params.get('idUser'); 
          if(userId){
            this.serviceU.findOne(+userId)
            .then(response=>{
              this.user=response.data
            })
          }
        })
      }
    }catch{
      console.error("Error")
    }
  }

  editProfil(id:number){
    let tel=this.newUser.tel;
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title:`Est-ce le bon numéro?\n${tel}`,
      showConfirmButton:true,
      showCancelButton:true,
      cancelButtonText:"Annuler",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      confirmButtonText:"Oui",
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then(result=>{
      if(result.isConfirmed){
        try{
          this.spinner.show();
          this.serviceU.updateProfil(id,this.user.email,this.user.name,tel,this.user.userinformation.address)
          .then(response=>{
            if(response.data.status){
              this.spinner.hide();
              Swal.fire("Modification enregistrée!","","success")
            }else{
              this.spinner.hide()
              Swal.fire("Une erreur s'est produite, vérifier les champs! ","","error")
            }
          })
        }catch{}
      }
    })
    
  }

}
