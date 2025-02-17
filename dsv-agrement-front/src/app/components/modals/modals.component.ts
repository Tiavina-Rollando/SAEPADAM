import { Component, Input, OnInit, Output, output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PdfService } from '../../services/pdf.service'
import { Location } from '@angular/common';
@Component({
  selector: 'app-modals',
  templateUrl: './modals.component.html',
  styleUrl: './modals.component.css'
})
export class ModalsComponent implements OnInit {
  constructor(
    private route: Router,
    private activatedRoute: ActivatedRoute,
    private servicePDF: PdfService,
    private location: Location
  ){}

  ngOnInit(): void {
    this.servicePDF.generateAgrementPDF();
    this.location.back()
  }
}
