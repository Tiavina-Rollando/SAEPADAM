import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router } from 'express';
import Swal from 'sweetalert2';
import { EtablissementService } from '../../services/etablissement.service';
import { UserService } from '../../services/user.service';
import { User } from '../../classes/user';

@Component({
  selector: 'app-create-veto',
  templateUrl: './create-veto.component.html',
  styleUrl: './create-veto.component.css'
})
export class CreateVetoComponent {

  user = new User
  constructor(
    private serviceU:UserService
  ){}
  insertUser(){
    this.serviceU.insertUser(3,this.user)
  }
}
