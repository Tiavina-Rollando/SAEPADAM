import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports:[
    CommonModule
  ],
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit{
  role!:string
  @Input() notif!:number
  @Input() unseen!:number

  constructor(
    private router : Router,
    private serviceU : UserService
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
        } else {
          this.router.navigate(['acceuil']);
        }
      })
      .catch((err) => {
        console.error('Erreur lors de la récupération de l\'utilisateur:', err.response.data);
      });
  }
  
}
