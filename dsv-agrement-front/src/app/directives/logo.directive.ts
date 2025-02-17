import { Directive, ElementRef, HostBinding, Input, OnInit } from '@angular/core';

@Directive({
  selector: '[appLogo]',
  standalone:true
})
export class LogoDirective implements OnInit{

  constructor(
    private element: ElementRef
  ) {} 

  @Input('appLogo') logoWidth!:string;

  @HostBinding('style.cursor') cursor = 'pointer'; // Facultatif : changer le curseur au survol
  
  @HostBinding('style.background-color') backgroundColor = 'transparent'; // Couleur de fond initiale
  
  @HostBinding('style.color') fontColor = 'Black';

  @HostBinding('style.border-radius') borderRadius = '50%';

  ngOnInit(){
    this.element.nativeElement.style.width=`${this.logoWidth}px`;
    this.element.nativeElement.style.marginLeft=`2%`;
  }

}
