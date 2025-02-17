import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PaginationService {
  private pageSizeSubject = new BehaviorSubject<number>(10); // Valeur par défaut
  private currentPageSubject = new BehaviorSubject<number>(1); // Valeur par défaut
  private dataNumberSubject = new BehaviorSubject<number>(50); // Valeur par défaut
  pageSize$ = this.pageSizeSubject.asObservable();
  currentPage$ = this.currentPageSubject.asObservable();
  dataNumber$ = this.dataNumberSubject.asObservable();

  constructor() { }

  setPageSize(pageSize: number): void {
    this.pageSizeSubject.next(pageSize);
  }
  setCurrentPage(currentPage: number): void {
    this.currentPageSubject.next(currentPage);
  }
  setDataNumber(dataNumber: number): void {
    this.dataNumberSubject.next(dataNumber);
  }
}
