import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import axios, { AxiosResponse } from 'axios';
import config from '../config';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class AgrementService {
  constructor(
    private serviceAuth:AuthService,
    private http : HttpClient
  ){}
  // Accéder à localStorage ici
  token = this.serviceAuth.getToken();
  httpOptions = {
    headers: {
        'Content-Type': 'application/json',
        'From': 'angular-front',
        'Authorization': this.token ? 'Bearer ' + this.token : '' // Assurez-vous que le jeton est inclus seulement s'il est disponible
    }
  }
  async findAll(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/agrements`, this.httpOptions);
  }
  async findOne(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/agrements/${id}`, this.httpOptions);
  }
  async findOneTrashed(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/agrements/trashed/${id}`, this.httpOptions);
  }
  async findTrashed(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/agrements/trashed`, this.httpOptions);
  }
  async deleteOne(id:number): Promise<AxiosResponse> {
    return await axios.delete(`${config.api_url}/agrements/${id}`, this.httpOptions);
  }
  async restoreOne(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/agrements/${id}/restore`,null, this.httpOptions);
  }
  async updateOne(id:number,numero:string,type_agrement_id:number,date_debut:string): Promise<AxiosResponse> {
    // const updateData = { numero, type_agrement_id ,date_debut : new Date(date_debut).toISOString()};
    console.log(`${date_debut}\n${numero}\n${type_agrement_id}`);
    return await axios.put(`${config.api_url}/agrements/${id}/update`,{ date_debut, numero, type_agrement_id } , this.httpOptions);
  }
  async retirer(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/agrements/${id}/retirer`,null, this.httpOptions);
  }
  async suspendre(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/agrements/${id}/suspendre`,null, this.httpOptions);
  }
  async activer(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/agrements/${id}/activer`,null, this.httpOptions);
  }
  async addRemark(id:number,description:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/remarques/store/${id}`,{description}, this.httpOptions);
  }
  async updateRemark(id:number,etat:boolean): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/remarques/${id}/update`,{etat}, this.httpOptions);
  }
  async deleteRemark(id:number): Promise<AxiosResponse> {
    return await axios.delete(`${config.api_url}/remarques/${id}/destroy`,this.httpOptions);
  }
}
