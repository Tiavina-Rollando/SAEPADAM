import { Component } from '@angular/core';
import Swal from 'sweetalert2';
import { User } from '../../classes/user';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-create-admin',
  templateUrl: './create-admin.component.html',
  styleUrl: './create-admin.component.css'
})
export class CreateAdminComponent {
  user = new User
  constructor(
    private serviceU:UserService
  ){}
  insertUser(){
    this.serviceU.insertUser(2,this.user)
  }
}
