import { Injectable } from '@angular/core';
import axios, { AxiosResponse } from 'axios';
import config from '../config';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root',
})
export class ConnexionService {

  async login(email: string, password: string): Promise<AxiosResponse> {

      const httpOptions = {
        headers: {
          'Content-Type': 'application/json',
          'From': 'angular-front'
        }
      };

      return await axios.post(`${config.api_url}/login`, { email, password }, httpOptions);

  }

  showError(){
    Swal.fire("Veuillez remplisser le formulaire s'il vous plaît!", "", "info")
  }
}
