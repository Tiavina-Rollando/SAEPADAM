import { Directive, ElementRef, Input, OnInit, Renderer2 } from '@angular/core';
import { ColorService } from '../services/color.service';

@Directive({
  selector: '[appColor]',
  standalone:true
})
export class ColorDirective implements OnInit {

  @Input() appColor!: string;

  vert:string=this.service.getColor('vert');
  orange:string=this.service.getColor('orange');
  rouge:string=this.service.getColor('rouge');
  jaune:string=this.service.getColor('jaune');
  
  constructor(
    private el: ElementRef,
    private renderer: Renderer2,
    private service: ColorService
  ) { }
  
  ngOnInit(): void {
    this.applyColor();
    this.vert=this.service.getColor('vert');
    this.orange=this.service.getColor('orange');
    this.rouge=this.service.getColor('rouge');
    this.jaune=this.service.getColor('jaune');
  }

  private applyColor(): void {
    switch (this.appColor) {
      case 'color1':
        this.applyStyle(this.vert);
        break;
      case 'color2':
        this.applyStyle(this.orange);
        break;
      case 'color3':
        this.applyStyle(this.rouge);
        break;
      case 'color4':
        this.applyStyle(this.jaune);
        break;
      default:
        this.applyStyle('transparent'); // Couleur par défaut si nécessaire
        break;
    }
  }

  private applyStyle(color: string): void {
    this.renderer.setStyle(this.el.nativeElement, 'background', color);
    this.renderer.setStyle(this.el.nativeElement, 'color', 'white');
  }
}
