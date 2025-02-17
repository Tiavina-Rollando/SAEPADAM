import { Component, Input } from '@angular/core';
import { CreateVetoComponent } from '../create-veto/create-veto.component'
import Swal from 'sweetalert2';
import { User } from '../../classes/user';
import { UserService } from '../../services/user.service';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-create-client',
  templateUrl: './create-client.component.html',
  styleUrl: './create-client.component.css'
})
export class CreateClientComponent {
  user = new User;
  data:any;
  emails: string[]=[];
  emailFiltred: string[]=[];
  
  ngOnInit(): void {
    this.serviceU.findAll()
    .then(response=>{
      // console.table(response.data)
      response.data.forEach((element:any) => {
        this.emails.push(element.email)
        // console.table(this.emails)
      });
    })
    .catch((err)=>{
      // console.log(err)
    })
  }
  
  constructor(
    private dataService : DataService,
    private serviceU : UserService,
  ){}
  
  insertUser(){
    this.serviceU.insertUser(4,this.user)
  }

}
