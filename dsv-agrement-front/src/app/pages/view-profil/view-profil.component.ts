import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { ColorDirective } from '../../directives/color.directive';
import { ColorService } from '../../services/color.service';

@Component({
  selector: 'app-view-profil',
  templateUrl: './view-profil.component.html',
  styleUrl: './view-profil.component.css'
})
export class ViewProfilComponent implements OnInit {
  user:any

  constructor(
    private serviceU:  UserService,
    private router: Router,
    private serviceColor: ColorService
  ){}
  ngOnInit(): void {
    try{
      if(typeof sessionStorage !== 'undefined'){
        let userId = sessionStorage.getItem('user')
        if(userId){
          this.serviceU.findOne(+userId)
          .then(response=>{
            this.user=response.data
          })
        } }
    }catch{
      console.error("Error")
    }
  }

  loggout(): void {
    let vert = this.serviceColor.getColor('vert');
    Swal.fire({
      title: 'Êtes-vous sûr de vous déconnecter?',
      showCancelButton: true,
      cancelButtonText: 'Annuler',
      confirmButtonText: 'Oui',
      confirmButtonColor:`${vert}`,
      customClass:{
        confirmButton:'color-un',
        denyButton:'color-trois',
      },
    }).then((result) => {
      if (result.isConfirmed) {
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true,
          didOpen: (toast) => {
            toast.onmouseenter = Swal.stopTimer;
            toast.onmouseleave = Swal.resumeTimer;
          }
        });
        Toast.fire({
          icon: 'success',
          title: 'Vous êtes bien déconnecté!'
        });

        sessionStorage.clear();
        localStorage.clear();
        this.router.navigate(['acceuil']);
      }
    });
  }
}

