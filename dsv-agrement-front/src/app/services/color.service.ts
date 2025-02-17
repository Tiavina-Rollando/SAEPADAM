import { Injectable, OnInit } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ColorService implements OnInit{

  constructor() {}
  
  vert:string='rgb(67, 151, 67)';
  orange:string='rgb(219, 156, 119)';
  rouge:string='rgb(139, 86, 65)';
  jaune:string='rgb(160, 145, 58)';

  ngOnInit(): void {
    this.vert='rgb(67, 151, 67)';
    this.orange='rgb(219, 156, 119)';
    this.rouge='rgb(139, 86, 65)';
    this.jaune='rgb(160, 145, 58)';    
  }
  
  getColor(color:string):string{
    switch (color){
      case 'vert':
        return this.vert;
        break;
      case 'orange':
        return this.orange;
        break;
      case 'rouge':
        return this.rouge;
        break;
      case 'jaune':
        return this.jaune;
      break;
      default:
        return "gray";
    }
  }
}
