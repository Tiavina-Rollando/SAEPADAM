import { Component, OnInit } from '@angular/core';
import { ConnexionService } from '../../services/connexion.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2'
import { UserService } from '../../services/user.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { DemandeAgrementService } from '../../services/demande-agrement.service';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent implements OnInit {
  email!: string;
  notif!:string|null
  password!: string;
  constructor(
    private serviceConnexion: ConnexionService,
    private serviceU: UserService,
    private route: Router,
    private serviceRequest : DemandeAgrementService,
    private spinner: NgxSpinnerService,
    private colorService: ColorService
  ) {}
  ngOnInit(): void {
   
  }

  async login() {

    if((this.email!=null)&&(this.password!=null)){
    
      this.spinner.show();

      this.serviceConnexion.login(this.email, this.password)
      .then(response => {
        
        if(response.data.status){
          sessionStorage.setItem('token',response.data.token);
          sessionStorage.setItem('user',response.data.user.id);
          this.route.navigate(['page/acc'])      
          this.spinner.hide();
          if((response.data.user.roles[0].id==1)||(response.data.user.roles[0].id==2)){

            const Toast = Swal.mixin({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
              }
            });
            Toast.fire({
              icon: "info",
              title: `Vous êtes bien connécté ${response.data.user.name}!`
            });
          }
          if(response.data.user.roles[0].id==4){
            const Toast = Swal.mixin({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
              }
            });
            Toast.fire({
              icon: "success",
              title: `Heureux de vous revoir ${response.data.user.name}!`
            });
          }
        }else{
          this.spinner.hide();
          Swal.fire({
            icon: "error",
            title: `Vérifier vos données`,
            showConfirmButton: false,
            timer: 1500
          });
        } 
      })
      .catch((err) => {
        // console.error(err.response.data);
      });
  
    }else{
      // this.serviceConnexion.showError()
    }
  }

  fonctionBoucle(email:string,id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    this.spinner.show();
    let randomCode = ""; 
    this.serviceU.sendCode(email)
      .then(res=>{
        randomCode=res.data.code.toString()
        this.spinner.hide();
        Swal.fire({
          title: "Saisissez le code secret qu'on vous a envoyé sur votre email:",
          input: "password",
          inputAttributes: {
            autocapitalize: "off"
          },
          showCancelButton: true,
          showDenyButton: true,
          confirmButtonColor:`${vert}`,
          denyButtonColor:`${orange}`,
          denyButtonText:"Réenvoyer le code",
          confirmButtonText: "OK",
          cancelButtonText:"Annuler",
          customClass:{
            confirmButton:'color1',
            denyButton:'color3',
          },
          showLoaderOnConfirm: true,
          allowOutsideClick: () => !Swal.isLoading()
        }).then((secretCode) => {
          if(secretCode.isDenied){
            this.fonctionBoucle(email,id)
          }else{
            if(secretCode.isConfirmed){
              this.spinner.show();
              if(secretCode.value===randomCode){
                this.spinner.hide();
                Swal.fire({
                  title: "Saisissez le nouveau mot de passe:",
                  input: "password",
                  inputAttributes: {
                  autocapitalize: "off"
                },
                showCancelButton: true,
                confirmButtonText: "OK", //0344227591
                cancelButtonText: "Annuler",
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                customClass:{
                  confirmButton:'color1',
                  denyButton:'color3',
                },
                showLoaderOnConfirm: true,
                allowOutsideClick: () => !Swal.isLoading()
                }).then((newPassword) => {
                  if(newPassword.isConfirmed){
                  Swal.fire({
                    title: "Ressaisissez le nouveau mot de passe:",
                    input: "password",
                    inputAttributes: {
                      autocapitalize: "off"
                    },
                    showCancelButton: true,
                    confirmButtonText: "OK",
                    cancelButtonText: "Annuler",
                    showLoaderOnConfirm: true,
                    confirmButtonColor:`${vert}`,
                    denyButtonColor:`${orange}`,
                    customClass:{
                      confirmButton:'color1',
                      denyButton:'color3',
                    },
                    allowOutsideClick: () => !Swal.isLoading()
                  }).then((newPasswordConf)=>{
                    if (newPasswordConf.isConfirmed){
                      this.spinner.show();
                      if(newPassword.value==newPasswordConf.value) {
                        this.spinner.hide();
                        this.serviceU.update(id,email,newPassword.value)
                        .then((response)=>{
                          if(response.data.status==true){
                            Swal.fire({
                              icon: "success",
                              title: `Vous avez réinitialisé votre mot de passe avec succès!`,
                              showConfirmButton: false,
                              timer: 1500
                            });
                          }
                        })
                        .catch(err=>{
                          this.spinner.hide()
                          Swal.fire({
                            icon: "error",
                            title: `Une erreur s'est produite lors de la réinitialisation de votre mot de passe, reéssayer après 5s`,
                            showConfirmButton: false,
                            timer: 5000
                          });
                        })
                      }else{
                        this.spinner.hide()
                        Swal.fire({
                          icon: "error",
                          title: `Vérifier votre mot de passe, recommencer après 5s`,
                          showConfirmButton: false,
                          timer: 5000
                        });
                      }
                  }else{
                    Swal.fire("Opération annulée", "", "error"); 
                  }
                }) 
                }else{
                  Swal.fire("Opération annulée", "", "error"); 
                }
              })     
            }else{
              this.spinner.hide();
              Swal.fire("Code incorrect!", "", "error"); 
            }      
          }
          }
        })
      }) 
  }
  
  show_password !: boolean
  showpassword(){
    this.show_password= !this.show_password
  }

  changePassword(){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Voulez-vous reinitialiser votre mot de passe?",
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText:"Oui",
      cancelButtonText:"Annuler",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "Saisissez votre adresse E-mail:",
          input: "email",
          inputAttributes: {
            autocapitalize: "off"
          },
          showCancelButton: true,
          confirmButtonText: "OK",
          cancelButtonText: "Annuler",
          confirmButtonColor:`${vert}`,
          denyButtonColor:`${orange}`,
          showLoaderOnConfirm: true,
          customClass:{
            confirmButton:'color1',
            denyButton:'color3',
          },
          allowOutsideClick: () => !Swal.isLoading()
        }).then((result:any) => {
          if (result.isConfirmed) {
                    
            this.spinner.show()
            
            this.serviceU.findByEmail(result.value)
              .then((response)=>{
                if(response.data.id){
                  this.spinner.hide();            
                  this.fonctionBoucle(response.data.email,response.data.id)
                }else{
                  this.spinner.hide();            
                  Swal.fire({
                    icon: "error",
                    title: `Une erreur s'est produite!`,
                    showConfirmButton: false,
                    timer: 2000
                  });
   
                }
              })
              .catch(()=>{
                this.spinner.hide();
                Swal.fire({
                  icon: "error",
                  title: `Votre email ne figure pas dans la base de données!`,
                  showConfirmButton: false,
                  timer: 2000
                });
              })      
          }
        });
      }
    });
  }
  validateEmail(emailInput:any){

  }
}
