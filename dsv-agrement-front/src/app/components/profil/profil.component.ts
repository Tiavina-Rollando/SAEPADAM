import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profil',
  standalone: true,
  imports:[
    CommonModule
  ],
  templateUrl: './profil.component.html',
  styleUrl: './profil.component.css'
})
export class ProfilComponent{
  @Input() role!:string;
  @Input() username!:string;
  @Input() userdepnumber!:number;

  constructor(
    private router: Router
  ){}

  editProfil(){
    this.router.navigate(['page/acc/profil'])
  }
}
