import { Injectable } from '@angular/core';
import axios, { AxiosResponse } from 'axios';
import config from '../config';
import { AuthService } from './auth.service';
import Swal from 'sweetalert2';
import { User } from '../classes/user';
import { response } from 'express';
import { NgxSpinnerService } from 'ngx-spinner';
import { ColorService } from './color.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(
    private serviceAuth:AuthService,
    private spinner : NgxSpinnerService,
    private serviceColor : ColorService
  ){}
  
  // Accéder à localStorage ici
  token = sessionStorage.getItem('token');
  httpOptions = {
    headers: {
        'Content-Type': 'application/json',
        'From': 'angular-front',
        'Authorization': this.token ? 'Bearer ' + this.token : '' // Assurez-vous que le jeton est inclus seulement s'il est disponible
    }
  };
  async findOneFirst(id:number,tokn:string): Promise<AxiosResponse> {
    this.httpOptions.headers.Authorization = 'Bearer '+tokn;
    console.log(this.httpOptions.headers)
    return await axios.get(`${config.api_url}/users/${id}`, this.httpOptions);
  }
  async findOne(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/users/${id}`, this.httpOptions);
  }
  async findAll(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/users`, this.httpOptions);
  }
  async create(name:string,email:string,password:string,role_id:number,tel: string, address: string,matricule:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/users/store`,{ name,email,password,role_id,tel,address,matricule },this.httpOptions);
  }
  async update(id:number,email:string,password:string): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/users/${id}/update`,{ email,password },this.httpOptions);
  }
  async updateProfil(id:number,email:string,name:string,tel:string,address:string): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/users/${id}/information/update`,{ name,email,tel,address },this.httpOptions);
  }
  async findByRoles(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/roles/${id}`, this.httpOptions);
  }
  async findByEmail(email:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/users/showByEmail`, {email}, this.httpOptions);
  }
  async getAllRoles(): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/roles`, this.httpOptions);
  }
  async getAllNotif(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/mine/notifications`, this.httpOptions);
  }
  async getUnseenNotif(tokn:string): Promise<AxiosResponse> {
    this.httpOptions.headers.Authorization = 'Bearer '+tokn;
    console.log(this.httpOptions.headers)
    return await axios.get(`${config.api_url}/mine/notifications/unseen`, this.httpOptions);
  }
  async deleteNotif(id:number): Promise<AxiosResponse> {
    return await axios.delete(`${config.api_url}/mine/notifications/${id}`, this.httpOptions);
  }
  async restoreNotif(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/mine/notifications/${id}/restore`, null, this.httpOptions);
  }
  async markAsSeen(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/mine/notifications/${id}/markAsSeen`,null, this.httpOptions);
  }
  async sendCode(email:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/mail/code`,{email}, this.httpOptions);
  }
  async sendPass(email:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/mail/pass`,{email}, this.httpOptions);
  }

createClientBoucle(user:User){
  this.spinner.show();
  // let code = this.sendCodewordEmail(user.email)
  this.sendCode(user.email)
    .then(response=>{
        if(response.data.code){
          this.spinner.hide()
          let code = response.data.code.toString()
          let vert = this.serviceColor.getColor('vert');
          let orange = this.serviceColor.getColor('orange');
          Swal.fire({
            title: "Saisissez le code secret qu'on vous a envoyé par E-mail:",
            input: "password",
            inputAttributes: {
              autocapitalize: "off"
            },
            showCancelButton: true,
            confirmButtonText: "OK",
            cancelButtonText: "Annuler",
            denyButtonText:"Réenvoyer le code",
            confirmButtonColor:`${vert}`,
            denyButtonColor:`${orange}`,
            customClass:{
              confirmButton:'color1',
              denyButton:'color3',
            },
            showDenyButton:true,
            showLoaderOnConfirm: true,
            allowOutsideClick: () => !Swal.isLoading()
           }).then((result) => {
            if(result.isDenied){
              this.createClientBoucle(user);
            }
            if (result.isConfirmed) {
              if(result.value==code){
                Swal.fire({
                  title: "Saisissez votre mot de passe:",
                  input: "password",
                  inputAttributes: {
                    autocapitalize: "off"
                  },
                  showCancelButton: true,
                  confirmButtonText: "OK",
                  confirmButtonColor:`${vert}`,
                  cancelButtonText: "Annuler",
                  customClass:{
                    confirmButton:'color1',
                    denyButton:'color3',
                  },
                  showLoaderOnConfirm: true,
                  allowOutsideClick: () => !Swal.isLoading()
                }).then((password) => {
                  if (password.isConfirmed) {
                    Swal.fire({
                      title: "Ressaisissez votre mot de passe:",
                      input: "password",
                      inputAttributes: {
                        autocapitalize: "off"
                      },
                      showCancelButton: true,
                      confirmButtonText: "OK",
                      cancelButtonText: "Annuler",
                      showLoaderOnConfirm: true,
                      confirmButtonColor:`${vert}`,
                      customClass:{
                        confirmButton:'color1',
                        denyButton:'color3',
                      },
                      allowOutsideClick: () => !Swal.isLoading()
                    }).then((passwordConf) => {
                      if (passwordConf.isConfirmed) {
                        this.spinner.show()
                        if(password.value==passwordConf.value){
                          this.create(user.name,user.email,password.value,4,user.userinformation.tel,user.userinformation.address,"")
                          .then(response => {
                            if(response.data.status==true){
                              this.spinner.hide()
                              Swal.fire("Vous êtes bien inscrit!", "", "success");
                              window.location.reload();
                            }
                          })
                          .catch((err) => {
                            this.spinner.hide()
                            Swal.fire("Une erreur s'est produite", "", "error");
                            console.log(err);
                          });
                        }else{
                          this.spinner.hide()
                          Swal.fire("Vérifier votre mot de passe!", "", "error");    
                        }    
                      }
                    })
                  }
                })
              }else{
                Swal.fire("Code incorrect", "", "error");    
              }
            }
          })
        }else{
          this.spinner.hide()
          Swal.fire("Une erreur s'est produite", "", "error");    
        }
    }) 
}

insertUser(user_role_id:number,user:User){
  if((user.name!="")&&(user.email!="")&&(user.userinformation.address!="")&&(user.userinformation.tel!="")){
    if(user_role_id==4){
      this.createClientBoucle(user);
    }else{  
      this.spinner.show()
      // let randomPass=this.sendPasswordEmail(user.email).toString();  
      this.sendPass(user.email)
        .then(response=>{
          if(response.data.pass){
            let randomPass = response.data.pass.toString()
            if(user_role_id==2){
              if(user.userinformation.matricule!=""){
                this.create(user.name,user.email,randomPass,user_role_id,user.userinformation.tel,user.userinformation.address,user.userinformation.matricule)
                .then(response => {
                  if(response.data.status==true){  
                    this.spinner.hide()
                    Swal.fire("Administrateur bien inscrit!", "", "success");
                  }
                })
                .catch((err) => {
                  this.spinner.hide()
                  Swal.fire("Une erreur s'est produite", "", "error");
                });
              }else{
                Swal.fire("Tous les champs sont obligatoires!", "", "info");    
              }
            }else{
              if(user_role_id==3){
                this.create(user.name,user.email,randomPass,user_role_id,user.userinformation.tel,user.userinformation.address,"")
                .then(response => {
                  if(response.data.status==true){
                    this.spinner.hide()
                    Swal.fire("Vétérinaire bien enregistré!", "", "success");
                  }
                })
                .catch((err) => {
                  this.spinner.hide()
                  Swal.fire("Une erreur s'est produite", "", "error");
                });
              }
            }      
          }
        })
     }
      
    }else{
      Swal.fire("Tous les champs sont obligatoires!", "", "info");    
    }
  }
}
