import { Injectable } from '@angular/core';
import axios, { AxiosResponse } from 'axios';
import config from '../config';
import { AuthService } from './auth.service';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class EtablissementService {
  constructor(
    private serviceAuth:AuthService,
    private serviceU:UserService
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
  async findAll(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/etablissements`, this.httpOptions);
  }
  async findOne(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/etablissements/${id}`, this.httpOptions);
  }
  async findByName(name:string): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/etablissements/showByName`, {name}, this.httpOptions);
  }
  async findAllMine(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/mine/etablissements`, this.httpOptions);
  }
  async findMine(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/mine/etablissements/${id}`, this.httpOptions);
  }
  async getAllActivities(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/typeactivites`, this.httpOptions);
  }
  async getAllFilieres(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/filieres`, this.httpOptions);
  }
  async getFiliere(id:number): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/filieres/${id}`, this.httpOptions);
  }
  async insert(name:string,filiere_id:number,type_etablissement:string,adresse:string,region:string,district:string,commune:string,type_produit:string,type_activite_id:number): Promise<AxiosResponse> {
    return await axios.post(`${config.api_url}/mine/etablissements/store`,{name,filiere_id,type_etablissement,adresse,region,district,commune,type_produit,type_activite_id}, this.httpOptions);
  }
  async insertWithAgrement(etablissement: any): Promise<AxiosResponse> {
        return await axios.post(`${config.api_url}/etablissements/store`, etablissement, this.httpOptions);
  }
  async update(id:number,etablissement: any): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/etablissements/${id}/update`, etablissement, this.httpOptions);
  }
  async delete(id:number): Promise<AxiosResponse> {
    return await axios.delete(`${config.api_url}/etablissements/${id}/destroy`, this.httpOptions);
  }
  async findTrashed(): Promise<AxiosResponse> {
    return await axios.get(`${config.api_url}/etablissements/trashed`, this.httpOptions);
  }
  async restore(id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/etablissements/${id}/restore`,null, this.httpOptions);
  }
  async addProprio(etablissement: any,id:number): Promise<AxiosResponse> {
    return await axios.put(`${config.api_url}/etablissements/${id}/addProprio`, etablissement, this.httpOptions);
  }

  findFiliere(id:number,item:any){
    this.getFiliere(id)
    .then(response=>{
      item.filiere=response.data.name
    })
    .catch()
  }
  
  async findUser(id: number, item: any) {
    try {
      const response = await this.serviceU.findOne(id);
      item.user = response.data.name;
    } catch (error) {
      console.error('Une erreur s\'est produite lors de la recherche de l\'utilisateur :', error);
    }
  }
}
