import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import axios, { AxiosResponse } from 'axios';
import config from '../config';

@Injectable({
  providedIn: 'root'
})
export class DemandeAgrementService {
  constructor(
    private serviceAuth: AuthService
  ){}
  // Accéder à localStorage ici
  token = this.serviceAuth.getToken();
  httpOptions = {
    headers: {
        'Content-Type': 'application/json',
        'From': 'angular-front',
        'Authorization': this.token ? 'Bearer ' + this.token : '' // Assurez-vous que le jeton est inclus seulement s'il est disponible
    }
  };
  async insert(type_agrement_id:number,etablissement_id:number): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/mine/etablissements/${etablissement_id}/demande-agrement`,{type_agrement_id}, this.httpOptions);
  }
  async findAll(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/demande/agrements`, this.httpOptions);
  }
  async findByStatus(status:number): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/demande/agrements/showByStatus`, {status} , this.httpOptions);
  }
  async findTrashed(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/demande/agrements/trashed`, this.httpOptions);
  }
  async findOne(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/demande/agrements/${id}`, this.httpOptions);
  }
  async findOneTrashed(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/demande/agrements/trashed/${id}`, this.httpOptions);
  }
  async deleteOne(id:number): Promise<AxiosResponse> {
    return await axios.delete(`${config.api_url}/demande/agrements/${id}`, this.httpOptions);
  }
  async restoreOne(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/demande/agrements/${id}/restore`,null,this.httpOptions);
  }
  async updateOne(id:number,status: number, numero: string ): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/demande/agrements/${id}`, {status,numero} , this.httpOptions);
  }
}
