import { Component, Input, OnChanges, OnDestroy, OnInit } from '@angular/core';
import { District, Region } from '../../classes/region';
import { ListRegions } from '../../classes/liste_region';
import { ListDistrict } from '../../classes/districts';
import { CommonModule, DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LogoDirective } from '../../directives/logo.directive';
import { EtablissementService } from '../../services/etablissement.service';
import { UserService } from '../../services/user.service';
import { PaginationService } from '../../services/pagination.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2'
import { AgrementService } from '../../services/agrement.service';
import { DemandeAgrementService } from '../../services/demande-agrement.service';
import { DataService } from '../../services/data.service';
import { NgxSpinner, NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-table',
  standalone: true,
  imports:[
    CommonModule,
    FormsModule,
    LogoDirective
  ],
  providers:[DatePipe],
  templateUrl: './table.component.html',
  styleUrl: './table.component.css'
})
export class TableComponent implements OnInit{
  @Input() object!: string;
  objet!:string;

  etats=[
    "Actif","Suspendu","Retiré"
  ];
  Types=[
    "Provisoire","Provisoire prolongé","Définitif"
  ];
  users!:any[];
  etablissements!:any[];
  filieres!:any[];
  regions:Region[]=ListRegions;
  districts:District[]=ListDistrict;
  selectedItems:any[]=[];  
  filtredItems:any[]=[];  
  currentPage!: number;
  pageSize!: number;
  searchTerms !: string;
  searchDate !: string;
  sortedData:any= [];
  sortOrder = 'asc'; // ou 'desc'
  
  trashedItems:number[]=[];  
  showDeleteButton:boolean=false;
  
  
  constructor(
    private serviceE : EtablissementService,
    private serviceU : UserService,
    private paginationService : PaginationService,
    private serviceA : AgrementService,
    private router : Router,
    private serviceDemA : DemandeAgrementService,
    private serviceData : DataService,
    private spinner :  NgxSpinnerService,
    private datePipe: DatePipe,
    private colorService : ColorService
    ) { }
    
  toggleItem(id: number, event: any): void {
    if (event.target.checked) {
      this.addTrashedItem(id);
    } else {
      this.removeTrashedItem(id);
    }
  }

  addTrashedItem(id: number): void {
    if (!this.trashedItems.includes(id)) {
      this.trashedItems.push(id);
    }
    this.checkDeleteButtonVisibility();
  }

  removeTrashedItem(id: number): void {
    const index: number = this.trashedItems.indexOf(id);
    if (index !== -1) {
      this.trashedItems.splice(index, 1);
    }
    this.checkDeleteButtonVisibility();
  }

  checkDeleteButtonVisibility(): void {
    // Vérifier si trashedItems contient au moins un élément pour afficher le bouton supprimer
    this.showDeleteButton = this.trashedItems.length > 0;
  }

  deleteSelectedItems(): void {
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title:"Supprimer les éléments séléctionnés?",
      showCancelButton:true,
      showConfirmButton:true,
      cancelButtonText:"Annuler",
      confirmButtonText:"Oui",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
    }).then(result=>{
      if(result.isConfirmed){
        // Supprimer les éléments dans filtredItems qui ont des IDs présents dans trashedItems
        this.filtredItems = this.filtredItems.filter(item => !this.trashedItems.includes(item.id));
        this.trashedItems.forEach(id => {
          if(this.object=="Nouveau agrement"){
            this.serviceU.deleteNotif(id)
            .then(response=>{
              Swal.fire(`${response.data.message}`,"","success");
              this.trashedItems = []; // Réinitialiser trashedItems après la suppression
              this.checkDeleteButtonVisibility(); // Vérifier la visibilité du bouton supprimer après la suppression
            })
            .catch(error=>{
              Swal.fire(`${error.data.message}`,"","error")
            })
          }
          if(this.object=="Demandes d'agrement"){
            this.serviceDemA.deleteOne(id)
            .then(response=>{
              Swal.fire(`${response.data.message}`,"","success");
              this.trashedItems = []; // Réinitialiser trashedItems après la suppression
              this.checkDeleteButtonVisibility(); // Vérifier la visibilité du bouton supprimer après la suppression
            })
            .catch(error=>{
              Swal.fire(`${error.data.message}`,"","error")
            })
          }
          if(this.object=="Toutes les demandes d'agrement"){
            this.serviceDemA.deleteOne(id)
            .then(response=>{
              Swal.fire(`${response.data.message}`,"","success");
              this.trashedItems = []; // Réinitialiser trashedItems après la suppression
              this.checkDeleteButtonVisibility(); // Vérifier la visibilité du bouton supprimer après la suppression
            })
            .catch(error=>{
              Swal.fire(`${error.data.message}`,"","error")
            })
          }
          if(this.object=="Agrements"){
            this.serviceA.deleteOne(id)
            .then(response=>{
              Swal.fire(`${response.data.message}`,"","success");
              this.trashedItems = []; // Réinitialiser trashedItems après la suppression
              this.checkDeleteButtonVisibility(); // Vérifier la visibilité du bouton supprimer après la suppression
            })
            .catch(error=>{
              Swal.fire(`${error.data.message}`,"","error")
            })
          }
          if((this.object=="Etablissements")||(this.object=="Mes établissements")){
            this.serviceE.delete(id)
            .then(response=>{
              Swal.fire(`${response.data.message}`,"","success");
              this.trashedItems = []; // Réinitialiser trashedItems après la suppression
              this.checkDeleteButtonVisibility(); // Vérifier la visibilité du bouton supprimer après la suppression
            })
            .catch(error=>{
              Swal.fire(`${error.data.message}`,"","error")
            })
          }
        });
      }
    })  
  }

  mark(id:number){
    this.serviceU.markAsSeen(id)
    .then(()=>{
      window.location.reload()
    })
  }

  sortData(column: string) {
    const isAsc = this.sortOrder === 'asc';
    this.sortedData.sort((a:any, b:any) => {
      const dateA = new Date(a[column]);
      const dateB = new Date(b[column]);
      return isAsc ? dateA.getTime() - dateB.getTime() : dateB.getTime() - dateA.getTime();
    });
    this.sortOrder = isAsc ? 'desc' : 'asc'; // Inverser l'ordre de tri pour le prochain clic
  }

  asc:boolean=true

  sortBy(property: string, ascending: boolean) {
    this.sortedData.sort((a:any, b:any) => {
      let comparison = 0;

      if (a[property] < b[property]) {
          comparison = -1;
      } else if (a[property] > b[property]) {
          comparison = 1;
      }

      // Reverse the order if descending
      if (!ascending) {
          comparison = comparison * -1;
      }
      this.asc=!this.asc
      return comparison;
    });
  }

  findFiliere(id:number,index:number,table:any[]){
    this.serviceE.getFiliere(id)
    .then(response=>{
      table[index].filiere=response.data.name
    })
    .catch()
  }

  ngOnInit(): void {

    if((this.object=='Administrateurs')||(this.object=='Vétérinaires')||(this.object=='Clients')){
      this.objet='Users';
    };
    if((this.object=='Nouveau agrement')||(this.object=='Mises à jour')||(this.object=='Toutes les mises à jour')){
      this.objet='Messages';
    };
    if((this.object=='Demandes d\'agrement')||(this.object=='Toutes les demandes d\'agrement')||(this.object=='Demandes d\'agrement supprimés')){
      this.objet='Demandes';
    };
    if((this.object=='Agrements')||(this.object=='Agrements supprimés')){
      this.objet='Agrements';
    };
    if((this.object=='Etablissements')||(this.object=='Etablissements supprimés')||(this.object=='Mes établissements')){
      this.objet='Etablissements';
    };

    this.paginationService.pageSize$.subscribe(pageSize => {
      this.pageSize = pageSize;
      // Mettre à jour les données affichées dans la table en fonction de la pageSize
    });
    this.paginationService.currentPage$.subscribe(currentPage => {
      this.currentPage = currentPage;
      // Mettre à jour les données affichées dans la table en fonction de la currentPage
    });

    this.serviceE.getAllFilieres()
    .then(response => {
      this.filieres=response.data
      })
      .catch((err) => {
        // console.log(err);
    });

    this.serviceE.findAll()
    .then(response => {
      this.etablissements=response.data
      })
      .catch((err) => {
        // console.log(err);
    });
  
    this.serviceU.findByRoles(4)
    .then(res=>{
      this.users=res.data.users
    });

    switch (this.object) {

      case "Etablissements":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceE.findAll()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.filtredItems.forEach(item => {
              if(item.user[0]){
                item.user.forEach((user: any) => {
                  if(user.roles[0].id==4){
                    item.proprio=user.name
                  }else{
                    item.proprio=""
                  }
                })
              }else{
                item.proprio=""
              }
            });
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
            
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
    
        }
        break;

      case "Etablissements supprimés":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceE.findTrashed()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.filtredItems.forEach(item => {
              if(item.user[0]){
                item.user.forEach((user: any) => {
                  if(user.roles[0].id==4){
                    item.proprio=user.name
                  }else{
                    item.proprio=""
                  }
                })
              }else{
                item.proprio=""
              }
            });
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;
        
      case "Demandes d'agrement":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceDemA.findByStatus(1)
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;
      
      case "Demandes d'agrement supprimés":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceDemA.findTrashed()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;
        
        case "Toutes les demandes d'agrement":
          if(typeof sessionStorage !== 'undefined'){
            this.serviceDemA.findAll()
            .then(response=>{
              this.selectedItems=response.data
              if(this.searchTerms!=null){
                this.search(this.searchTerms)
              }else{
                this.filtredItems=this.selectedItems
              }
              this.sortedData=this.filtredItems
              this.paginationService.setDataNumber(this.filtredItems.length)
            })
            .catch(err => {
              // Gérer les erreurs éventuelles
              // console.error(err);
            });
          }
          break;
          
      case "Agrements":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceA.findAll()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }

            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
            
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;

      case "Agrements supprimés":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceA.findTrashed()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }

            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
            
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
    
        }
        break; 

      case "Mes établissements":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceE.findAllMine()
          .then(response=>{
            this.selectedItems=response.data
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;
      
      case "Administrateurs":
        if (typeof sessionStorage !== 'undefined') {
          // Access sessionStorage here
          this.serviceU.findByRoles(2)
          .then(response=>{
            this.selectedItems=response.data.users
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }        
        break;
    
      case "Vétérinaires":
        if(typeof sessionStorage !== 'undefined'){
          this.serviceU.findByRoles(3)
          .then(response=>{
            this.selectedItems=response.data.users
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
        }
        break;

      case "Clients":
        if(typeof sessionStorage!=='undefined'){
          this.serviceU.findByRoles(4)
          .then(response=>{
            this.selectedItems=response.data.users
            if(this.searchTerms!=null){
              this.search(this.searchTerms)
            }else{
              this.filtredItems=this.selectedItems
            }
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
    
        }
        break;
        
        case "Nouveau agrement":
        if(typeof sessionStorage!=='undefined'){
          this.serviceU.getAllNotif()
          .then(response=>{
            this.selectedItems=response.data
            this.filtredItems=this.selectedItems
            this.sortedData=this.filtredItems
            this.paginationService.setDataNumber(this.filtredItems.length)
          })
          .catch(err => {
            // Gérer les erreurs éventuelles
            // console.error(err);
          });
    
        }
        break;

      default:
        break;
    }
    // console.table(this.selectedItems)
    
  }

  reload(){
    window.location.reload()
  }
  setSearch(term:string){
    this.searchTerms=term
  }

  searchByRegion(region:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.region==region
    )
  }
  searchByDistrict(district:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.district==district
    )
  }
  searchByFiliere(filiere:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.filiere.name==filiere
    )
  }
  searchByEtat(etat:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.etat==etat
    )
  }
  searchByType(type:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.typeagrement.name==type
    )
  }
  searchByUser(user:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.proprio==user
    )
  }
  searchByEtablissement(etablissement:string){
    this.filtredItems = this.selectedItems.filter(item =>
      item.etablissement[0].name==etablissement
    )
  }
  search(term:string){
    if((this.objet=="Etablissements")||(this.objet=="Users")){
      this.filtredItems = this.selectedItems.filter(item =>
        item.name.toLowerCase().includes(term.toLowerCase())
      )
    }
    if(this.objet=="Agrements"){
      this.filtredItems = this.selectedItems.filter(item =>
        item.numero.toLowerCase().includes(term.toLowerCase())
      )
    }
  }

  searchByDate(date:string){
    
    let dateFormated=this.datePipe.transform(date,'yyyy-MM-dd');
    
    this.filtredItems = this.selectedItems.filter(item =>
      item.created_at.includes(dateFormated)
    )
  }

  show(type:string){
    if(type=='agreed'){
      if(typeof sessionStorage !== 'undefined'){
        this.serviceE.findAll()
        .then(response=>{
          this.selectedItems=[];
          response.data.forEach((etablissement:any) => {
            if(etablissement.agrement.length>0){
              this.selectedItems.push(etablissement)
            }            
          });
          if(this.searchTerms!=null){
            this.search(this.searchTerms)
          }else{
            this.filtredItems=this.selectedItems
          }
          this.filtredItems.forEach(item => {
            if(item.user[0]){
              item.user.forEach((user: any) => {
                if(user.roles[0].id==4){
                  item.proprio=user.name
                }else{
                  item.proprio=""
                }
              })
            }else{
              item.proprio=""
            }
          });
          this.sortedData=this.filtredItems
          this.paginationService.setDataNumber(this.filtredItems.length)
          
        })
        .catch(err => {
          // Gérer les erreurs éventuelles
          // console.error(err);
        });
      }
    }
    if(type=='disagreed'){
      if(typeof sessionStorage !== 'undefined'){
        this.serviceE.findAll()
        .then(response=>{
          this.selectedItems=[];
          response.data.forEach((etablissement:any) => {
            if(etablissement.agrement.length==0){        
              this.selectedItems.push(etablissement)
            }            
          });
          if(this.searchTerms!=null){
            this.search(this.searchTerms)
          }else{
            this.filtredItems=this.selectedItems
          }
          this.filtredItems.forEach(item => {
            if(item.user[0]){
              item.user.forEach((user: any) => {
                if(user.roles[0].id==4){
                  item.proprio=user.name
                }else{
                  item.proprio=""
                }
              })
            }else{
              item.proprio=""
            }
          });
          this.sortedData=this.filtredItems
          this.paginationService.setDataNumber(this.filtredItems.length)
        })
        .catch(err => {
          // Gérer les erreurs éventuelles
          // console.error(err);
        });
      }
    }
    if(type=='all'){
      if(typeof sessionStorage !== 'undefined'){
        this.serviceE.findAll()
        .then(response=>{
          this.selectedItems=[];
          this.selectedItems=response.data
          if(this.searchTerms!=null){
            this.search(this.searchTerms)
          }else{
            this.filtredItems=this.selectedItems
          }
          this.filtredItems.forEach(item => {
            if(item.user[0]){
              item.user.forEach((user: any) => {
                if(user.roles[0].id==4){
                  item.proprio=user.name
                }else{
                  item.proprio=""
                }
              })
            }else{
              item.proprio=""
            }
          });
          this.sortedData=this.filtredItems
          this.paginationService.setDataNumber(this.filtredItems.length)
        })
        .catch(err => {
          // Gérer les erreurs éventuelles
          // console.error(err);
        });
      }
    }
  }


  goToDetail(object:string,id:number){
    
    this.spinner.show()
    
    this.router.navigate([`page/acc/${object}/detail`])  
    setTimeout(() => {
      this.spinner.hide();
    }, 1000);
      
    sessionStorage.setItem('idItem',id.toLocaleString()); 
  }
  
  suppression(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Suppression",
      showCancelButton: true,
      cancelButtonText: "Annuler",
      confirmButtonText: `Déplacer dans la corbeille`,
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

          if((this.object=="Etablissements")||(this.object=="Mes établissements")){
            this.serviceE.delete(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
        
              Swal.fire({
                title: "Etablissement déplacé dans la corbeille",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success",
                customClass:{
                  confirmButton:'color1',
                  denyButton:'color3',
                }
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  if (result.isConfirmed) {
                    
                    window.location.reload()
                  }
              });
            })
          }
         
          if(this.object=="Agrements"){
            this.serviceA.deleteOne(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
        
              Swal.fire({
                title: "Agrement déplacé dans la corbeille",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success",
                customClass:{
                  confirmButton:'color1',
                  denyButton:'color3',
                }
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  if (result.isConfirmed) {
                    
                    window.location.reload()
                  }
              });
            })
          }
          if(this.object=="Demandes d\'agrement"){
            this.serviceDemA.deleteOne(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
        
              Swal.fire({
                title: "Demande d'agrement déplacé dans la corbeille",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success"
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  if (result.isConfirmed) {
                    
                    window.location.reload()
                  }
              });
            })
          }
      }
    });
  }

  detailUser(id:number){
    this.router.navigate([`page/acc/profil/edit/${id}`]);
  }

  restore(id:number){
    let vert = this.colorService.getColor('vert');
    let orange = this.colorService.getColor('orange')
    Swal.fire({
      title: "Restauration",
      showCancelButton: true,
      cancelButtonText: "Annuler",
      confirmButtonColor:`${vert}`,
      denyButtonColor:`${orange}`,
      confirmButtonText: `Confirmer`,
      customClass:{
        confirmButton:'color1',
        denyButton:'color3',
      }
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          this.spinner.show()
    
          if(this.object=="Agrements supprimés"){
            this.serviceA.restoreOne(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
        
              Swal.fire({
                title: "Agrement bien restauré",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success"
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  
                  if (result.isConfirmed) {
                    
                    window.location.reload()
                  }
              });
            })
            .catch(()=>{
              Swal.fire("Une erreur s'est produite lors de la restauration", "", "error");  
            })
          }
          if(this.object=="Etablissements supprimés"){
            this.serviceE.restore(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
        
              Swal.fire({
                title: "Etablissement bien restauré",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success"
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  
                  if (result.isConfirmed) {
                    
                    window.location.reload()
                  }
              });
            })
            .catch(()=>{
              Swal.fire("Une erreur s'est produite lors de la restauration", "", "error");  
            })
          }
          if(this.object=="Demandes d\'agrement supprimés"){
            this.serviceDemA.restoreOne(id)
            .then(()=>{
              setTimeout(() => {
                /** spinner ends after 5 seconds */
                this.spinner.hide();
              }, 1000);
  
              Swal.fire({
                title: "Demande d'Agrement bien restaurée",
                showCancelButton: false,
                confirmButtonText: `OK`,
                confirmButtonColor:`${vert}`,
                denyButtonColor:`${orange}`,
                icon : "success",
                customClass:{
                  confirmButton:'color1',
                  denyButton:'color3',
                }
                }).then((result) => {
                  /* Read more about isConfirmed, isDenied below */
                  if (result.isConfirmed) {
              
                    window.location.reload()
                  }
              });
            })
            .catch(()=>{
              Swal.fire("Une erreur s'est produite lors de la restauration", "", "error");  
            })
           
          }
      }
    });
  }
}
