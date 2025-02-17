import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private tokenKey = 'token';

  constructor() { }

  // Méthode pour définir le token après la connexion de l'utilisateur
  setToken(token: string): void {
    if (typeof sessionStorage !== 'undefined') {
      sessionStorage.setItem(this.tokenKey, token);
    } else {
      // Gérer le cas où sessionStorage n'est pas disponible (par exemple, en utilisant une autre méthode de stockage)
      console.error('sessionStorage is not available');
    }
  }

  // Méthode pour récupérer le token
  getToken(): string | null {
    if (typeof sessionStorage !== 'undefined') {
      return sessionStorage.getItem(this.tokenKey);
    } else {
      // Gérer le cas où sessionStorage n'est pas disponible
      console.error('sessionStorage is not available');
      return null;
    }
  }

  // Méthode pour effacer le token après la déconnexion de l'utilisateur
  clearToken(): void {
    if (typeof sessionStorage !== 'undefined') {
      sessionStorage.removeItem(this.tokenKey);
    } else {
      // Gérer le cas où sessionStorage n'est pas disponible
      console.error('sessionStorage is not available');
    }
  }
}
