import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-profil',
  standalone: true,
  imports:[
    CommonModule
  ],
  templateUrl: './profil.component.html',
  styleUrl: './profil.component.css'
})
export class ProfilComponent implements OnInit{
  role!:string;
  username!:string;
  userdepnumber!:number;

  constructor(
    private router: Router,
    private serviceU:UserService
  ){}
  
  ngOnInit(): void {
    const userId = sessionStorage.getItem('user');
    if (!userId) {
      console.error('Aucun utilisateur trouvé en session');
      this.router.navigate(['acceuil']);
      return;
    }
  
    this.serviceU.findOne(+userId)
      .then(response => {
        if (response.data) {
          this.role = response.data.roles[0].name;
          console.log("Rôle :", this.role);
          this.userdepnumber = response.data.etablissement.length;
          console.log("Departement :", this.userdepnumber);
          this.username = response.data.name;
          console.log("Username :", this.username);
        } else {
          this.router.navigate(['acceuil']);
        }
      })
      .catch((err) => {
        console.error('Erreur lors de la récupération de l\'utilisateur:', err.response.data);
      });
  }
  
  editProfil(){
    this.router.navigate(['page/acc/profil'])
  }
}
