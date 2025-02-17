import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { PaginationService } from '../../services/pagination.service';

@Component({
  selector: 'app-pagination',
  standalone: true,
  imports:[CommonModule,FormsModule],
  templateUrl: './pagination.component.html',
  styleUrl: './pagination.component.css'
})
export class PaginationComponent implements OnInit {
  currentPage!: number;
  dataNumber!: number; // Valeur par défaut
  indices!: number[];
  pageSize!: number ;

  constructor(private paginationService: PaginationService) { }

  
  setPageSize(pageSize: number): void {
    this.paginationService.setPageSize(pageSize);
    this.calculateIndices()
  }

  ngOnInit(): void {
    this.paginationService.dataNumber$.subscribe(dataNumber => {
      this.dataNumber = dataNumber;
      this.calculateIndices()
      // console.log(this.dataNumber, this.pageSize)
    });
    this.paginationService.pageSize$.subscribe(pageSize => {
      this.pageSize = pageSize 
      // console.log(this.dataNumber, this.pageSize)
    });
    // console.log(this.dataNumber, this.pageSize)
    this.calculateIndices()
  }
  
  calculateIndices(): void {
    this.indices = Array.from({ length: Math.ceil(this.dataNumber / this.pageSize) }, (_, i) => i);
  }

  sendCurrentPage(numero: number): void {
    if((numero>0)&&(numero<=this.indices.length)) {
      this.paginationService.setCurrentPage(numero)
      this.currentPage=numero
    };
  }
}
