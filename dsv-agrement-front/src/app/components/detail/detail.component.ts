import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { CommonModule } from '@angular/common';
import { InfoAgrementComponent } from '../info-agrement/info-agrement.component';
import { InfoDemandeComponent } from '../info-demande/info-demande.component';
import { InfoEtablissementComponent } from '../info-etablissement/info-etablissement.component';
import { DataService } from '../../services/data.service';
import { NgxSpinnerComponent } from 'ngx-spinner';
import { EtablissementService } from '../../services/etablissement.service';
import { UserService } from '../../services/user.service';
import { AgrementService } from '../../services/agrement.service';
import { DemandeAgrementService } from '../../services/demande-agrement.service';

@Component({
    selector: 'app-detail',
    standalone: true,
    imports: [
      InfoAgrementComponent,
      InfoDemandeComponent,
      InfoEtablissementComponent,
      CommonModule,
      NgxSpinnerComponent
    ],
    templateUrl: './detail.component.html',
    styleUrl: './detail.component.css',
    })
export class DetailComponent implements OnInit{
  
  constructor(
    private activatedRoute:ActivatedRoute,
    private serviceData : DataService,
    private serviceE : EtablissementService,
    private serviceU : UserService,
    private serviceA : AgrementService,
    private serviceDemA : DemandeAgrementService,
    ){}
    
  hasSendRequest!:boolean;
  object!:string;
  id!:number;
  hasAgrement!:boolean;
  withAgrement!:string;
  agrement!:any;
  qrcodeUrl!:string;
  demande!:any;
  etablissement!:any;
  user!:any;
  
  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe((params:ParamMap)=>{
      const o = params.get('object');
      if(o){
        this.object=o;
      }
    });

    switch (this.object) {

      case "Etablissements":

        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
          
            this.serviceE.findOne(this.id)
            .then(response=>{
              this.etablissement = response.data;
              let numero = response.data.demandeagrement.length -1;
              this.demande = response.data.demandeagrement[numero];
              this.serviceData.setRequestData(response.data.demandeagrement[numero]);
              let num = response.data.agrement.length -1;
              this.agrement = response.data.agrement[num];
              this.serviceData.setAgreementData(response.data.agrement[num]);
              this.qrcodeUrl = response.data.qrcode;
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
          
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
          }
        }
    
        break;
        
      case "Demandes d'agrement":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
            
            this.serviceDemA.findOne(this.id)
            .then(response=>{
              this.etablissement = response.data.etablissement;
              this.demande = response.data;
              this.serviceData.setRequestData(response.data);
              this.agrement = null;
              this.serviceData.setAgreementData(null);
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
              
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };
              
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
          
  
          }
        }
        break;
      
      case "Demandes d'agrement supprimés":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
            
            this.serviceDemA.findOneTrashed(this.id)
            .then(response=>{
              this.etablissement.response.data.etablissement;
              this.demande = response.data;
              this.serviceData.setRequestData(response.data);
              this.agrement = null;
              this.serviceData.setAgreementData(null);
              
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
              
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
            if(this.demande != null){
              // console.table(this.requestData)
              this.hasSendRequest=true
            }else{
              this.hasSendRequest=false
            };
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
                
          }
        }
        break;
        
      case "Toutes les demandes d'agrement":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
          
            this.serviceDemA.findOne(this.id)
            .then(response=>{
              this.etablissement = response.data.etablissement;
              this.demande = response.data;
              this.serviceData.setRequestData(response.data);
              this.agrement = null;
              this.serviceData.setAgreementData(null);
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
        
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
      
          }
        }
    
        break;
      
      case "Agrements":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
          
            this.serviceA.findOne(this.id)
            .then(response=>{
              this.etablissement = response.data.etablissement[0];
              if(response.data.demande_agrement.length>0){
                this.demande = response.data.demande_agrement[0];
                this.serviceData.setRequestData(this.demande);
              }else{
                this.demande=null;
                this.serviceData.setRequestData(this.demande);
              }
              this.agrement = response.data;
              this.serviceData.setAgreementData(response.data);
              this.user = response.data.etablissement[0].user[0];
              this.serviceData.setUserData(response.data.etablissement[0].user[0]);
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null)
              }
              this.serviceData.setEstablishmentData(this.etablissement);
        
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
        
          }
        }
    
        break;

      case "Agrements supprimés":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
          
            this.serviceA.findOneTrashed(this.id)
            .then(response=>{
              this.etablissement = response.data.etablissement[0];
              this.demande = null;
              this.serviceData.setRequestData(null);
              this.agrement = response.data;
              this.serviceData.setAgreementData(response.data);
              this.user = response.data.etablissement[0].user[0];
              this.serviceData.setUserData(response.data.etablissement[0].user[0]);
              
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
            
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
          }
        }
    
        break;  

      case "Mes établissements":
        if(typeof sessionStorage !== 'undefined'){
          let idItem = sessionStorage.getItem('idItem');
          if(idItem){
            this.id = +idItem;
          
            this.serviceE.findMine(this.id)
            .then(response=>{
              this.etablissement = response.data;
              let num = response.data.demandeagrement.length -1;
              this.demande = response.data.demandeagrement[num];
              this.serviceData.setRequestData(this.demande);
              if(response.data.agrement.length>0){
                let numero = response.data.agrement.length -1;
                this.agrement = response.data.agrement[numero];
              }else{
                this.agrement = null;
              }
              this.serviceData.setAgreementData(this.agrement);
              this.qrcodeUrl= response.data.qrcode;
              if(this.etablissement.user.length>0){
                this.etablissement.user.forEach((user:any)=>{
                  if(user.roles[0].id==4){
                    this.user = user;
                    if(this.user.name){
                      this.etablissement.proprio=this.user.name;
                    }else{
                      this.etablissement.proprio=""
                    }
                    this.serviceData.setUserData(user);  
                  }
                })
              }else{
                this.user = null;
                this.serviceData.setUserData(null);
              }
              this.serviceData.setEstablishmentData(this.etablissement);
          
              if(this.agrement!=null){
                // console.table(this.agreementData)
                this.hasAgrement=true;
                this.withAgrement="true"
              }else{
                this.hasAgrement=false;
                this.withAgrement="false"
              };
          
              if(this.demande != null){
                // console.table(this.requestData)
                this.hasSendRequest=true
              }else{
                this.hasSendRequest=false
              };          
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });    
          }
        }
        break;
    }
    
  }
}
