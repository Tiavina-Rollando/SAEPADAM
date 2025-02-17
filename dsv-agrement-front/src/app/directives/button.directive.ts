import { Directive, ElementRef, HostBinding,Renderer2, HostListener, Input, OnInit } from '@angular/core';

@Directive({
  selector: '[appButton]'
})
export class ButtonDirective implements OnInit {

  @HostBinding('style.cursor') cursor = 'pointer';
  @HostBinding('style.width') width!:string;

  constructor(
    private el: ElementRef,
    private renderer: Renderer2
  ) {}

  ngOnInit(): void {
    // Tu peux ajouter des initialisations ici si nécessaire
  }

  // Méthode pour définir le style au survol
  @HostListener('mouseenter') onMouseEnter(): void {
    this.renderer.addClass(this.el.nativeElement, 'show-text');
    this.renderer.setStyle(this.el.nativeElement, 'width', 'auto' );
  }

  // Méthode pour réinitialiser le style après le survol
  @HostListener('mouseleave') onMouseLeave(): void {
    this.renderer.removeClass(this.el.nativeElement, 'show-text');
    this.renderer.setStyle(this.el.nativeElement, 'width', '40%' );
  }
}
