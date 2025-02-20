import { Component, OnChanges, OnDestroy, OnInit, SimpleChanges } from '@angular/core';
import { ProfilComponent } from '../../components/profil/profil.component';
import { MenuComponent } from '../../components/menu/menu.component';
import { TableComponent } from '../../components/table/table.component';
import { PaginationComponent } from '../../components/pagination/pagination.component';
import { ActivatedRoute, ParamMap, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { UserService } from '../../services/user.service';
import { DemandeAgrementService } from '../../services/demande-agrement.service';
import Echo from 'laravel-echo';
import Swal from 'sweetalert2';
import { Subscription } from 'rxjs';
import { DataService } from '../../services/data.service';
import Pusher from 'pusher-js';
import pusherJs from 'pusher-js';
import { Token } from '@angular/compiler';

@Component({
  selector: 'app-admin',
  standalone: true,
  imports: [
    ProfilComponent,
    MenuComponent,
    TableComponent,
    PaginationComponent,
    CommonModule
  ],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent implements OnInit{
  
  pusher !: pusherJs;
  echo !: any;
  
  notif!:number;
  unseen!:number;
  objet!:string;
  roles!:string;
  dep!:string;
  name!:string;
  nbr!:number;
  hasObjet!:boolean
  idU!:string|null
  token !: string;

  constructor(
    private activatedRoute:ActivatedRoute,
    private serviceU : UserService,
    private serviceRequest: DemandeAgrementService,
    private router : Router,
  ){
    this.websocket();
  }

  websocket(){   
    this.echo = new Echo({
      broadcaster: 'pusher',
      key: 'b62409e4f54a3caed2b8',
      cluster: 'mt1',
      wsHost: 'localhost',
      wsPort: 6001,
      forceTLS: false,
      disableStats: true,
    });
  }

  playAudio(){
    const audio = new Audio("../../../assets/ringtone.mp3");
    audio.play();
  }

  websocketChannelListening(){
    this.echo.channel('notif')
    .listen('NotificationPusher', (res: any) =>{
      // console.log('Notification data: ', res.message);
      this.loadNotifications();
      if(((res.message=="Client")&&(res.name==this.name))||((res.message=="Admin")&&((this.roles=="Administrateur")||(this.roles=="Super Administrateur")))){
        this.playAudio();
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
          title: `Vous avez réçu une nouvelle notification!`
        });
      }
    })
  }
    
  loadNotifications(){
    const tkn = sessionStorage.getItem('token');
    if (!tkn) {
      console.error('Aucun token trouvé en session');
      return;
    }
    if(tkn){
      this.serviceU.getUnseenNotif(tkn)
      .then(response=>{
        this.unseen = response.data.length;
      })
    
    
      this.serviceRequest.findByStatusFirst(1,tkn)
      .then(response=>{
        this.notif = response.data.length
      })
    }
  }

  ngOnInit(): void {
    
    this.websocketChannelListening();

    this.loadNotifications();
    
    this.activatedRoute.paramMap.subscribe((params:ParamMap)=>{
      const o = params.get('object');
      if(o){
        this.hasObjet=true;
        this.objet=o
      } 
    })
     
  }

  goToTrashed(object:string){
    this.router.navigate([`page/acc/${object} supprimés`])
  }
}
