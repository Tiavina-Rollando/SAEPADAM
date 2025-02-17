  
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private establishmentData : any = null;
  private userData : any = null;
  private requestData : any = null;
  private agreementData : any = null;
  constructor() {}


  setEstablishmentData(data: any) {
    this.establishmentData = null;
    this.establishmentData = data
  }

  getEstablishmentData(): any {
    return this.establishmentData
  }

  setUserData(data: any) {
    this.userData = null;
    this.userData = data
  }

  getUserData(): any {
    return this.userData
  }

  setRequestData(data: any) {
    this.requestData = null;
    this.requestData = data
  }

  getRequestData(): any {
    return this.requestData
  }

  setAgreementData(data: any) {
    this.agreementData = null;
    this.agreementData = data
  }

  getAgreementData(): any {
    return this.agreementData
  }
}
