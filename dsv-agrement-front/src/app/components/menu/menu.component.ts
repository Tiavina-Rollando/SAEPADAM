import { CommonModule } from '@angular/common';
import { Component, Input, input } from '@angular/core';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports:[
    CommonModule
  ],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent {
  @Input() role!:string
  @Input() notif!:number
  @Input() unseen!:number
}
