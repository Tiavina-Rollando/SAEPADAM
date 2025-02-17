import { animate, state, style, transition, trigger } from '@angular/animations';
import { isPlatformBrowser } from '@angular/common';
import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-acceuil',
  templateUrl: './acceuil.component.html',
  styleUrl: './acceuil.component.css',
  animations: [
    trigger('cardAnimation', [
      state('left', style({
        transform: 'translateX(-680px) ',
        zIndex: 1
      })),
      state('centerLeft', style({
        transform: 'translateX(-486px) ',
        zIndex: 2
      })),
      state('centerRight', style({
        transform: 'translateX(96px)',
        zIndex: 2
      })),
      transition('* <=> *', [
        animate('1s')
      ])
    ])

  ]
})
export class AcceuilComponent implements OnInit {
  isExpanded1 = false;
  isExpanded2 = false;
  
  toggleExpanded(cardNumber: number) {
    if (cardNumber === 1) {
      this.isExpanded1 = !this.isExpanded1;
    } else if (cardNumber === 2) {
      this.isExpanded2 = !this.isExpanded2;
    }
  }
  
  cardState1 = 'left';
  cardState2 = 'centerLeft';

  onCardClick(cardNumber: number) {
    if (cardNumber === 1) {
      if(this.cardState1 == 'centerRight'){
        this.cardState1 = 'centerLeft';
        this.cardState2 = 'left';
        
      }else{
        this.cardState2 = 'left';
        this.cardState1 = 'centerRight';  
      }
      this.isExpanded2=false
      this.isExpanded1=!this.isExpanded1
      
    } else if (cardNumber === 2) {
      if(this.cardState2 == 'centerRight'){
        this.cardState1 = 'left';
        this.cardState2 = 'centerLeft';
        
      }else{
        this.cardState1 = 'left';
        this.cardState2 = 'centerRight';  
      }
        
      this.isExpanded1=false
      this.isExpanded2=!this.isExpanded2
    }
  }

  // cardStates = ['left', 'center', 'right'];

  // onCardClick() {
  //   this.cardStates = [
  //     this.cardStates[2],
  //     this.cardStates[0],
  //     this.cardStates[1]
  //   ];
  // }

  constructor(
    @Inject(PLATFORM_ID) private platformId: Object,
    private router:Router
  ){}
  
  title = 'Service d\'Agrement des Etablissements à Produits Alimmentaires Dérivés Animaux';
  
  ngOnInit(): void {
  
    if (isPlatformBrowser(this.platformId)) {
      window.addEventListener('scroll', () => {
        const header = document.getElementById('header');
        if (header) {
          if (window.scrollY > 50) {
            header.style.backgroundColor = 'transparent';
          } else {
            header.style.backgroundColor = '#212529'; // Change to desired color
          }
        }
      });
    }
    
  }
}
