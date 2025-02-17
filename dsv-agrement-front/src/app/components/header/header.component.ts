import { Component, Inject, OnInit, AfterViewInit, PLATFORM_ID } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { filter } from 'rxjs/operators';
import { Location, isPlatformBrowser } from '@angular/common';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit, AfterViewInit {
  isLogged!: boolean;
  isAcc!: boolean;
  modals!: boolean;

  constructor(
    @Inject(PLATFORM_ID) private platformId: Object,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private location: Location,
  ) { }

  ngOnInit(): void {
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe((event: any) => {
      const currentUrl = event.url;
      this.isAcc = currentUrl.includes('acceuil') || (currentUrl == '/');
      this.isLogged = currentUrl.includes('page');
    });
  }

  ngAfterViewInit(): void {
    if (isPlatformBrowser(this.platformId)) {
      window.addEventListener('scroll', () => {
        const header = document.getElementById('header');
        const titre = document.getElementById('titre');
        const rep = document.getElementById('rep');

        if (header&&titre&&rep) {
          if (window.scrollY > 50) {
            header.classList.remove('bg-body-tertiary'); // Retire la classe pour restaurer la couleur de fond Bootstrap par défaut
            header.classList.add('bg-body-transparent'); // Ajoute une classe pour rendre le fond transparent
            titre.classList.add('hidden');
            rep.classList.add('hidden');
          } else {
            header.classList.add('bg-body-tertiary'); // Ajoute la classe pour restaurer la couleur de fond Bootstrap par défaut
            header.classList.remove('bg-body-transparent'); // Retire la classe pour rendre le fond non transparent
            titre.classList.remove('hidden');
            rep.classList.remove('hidden');
          }
        }
      });
    }
  }

  retour(): void {
    this.location.back();
  }

}
