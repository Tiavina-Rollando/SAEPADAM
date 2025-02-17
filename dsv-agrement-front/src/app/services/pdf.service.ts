import { DatePipe } from '@angular/common';
import { Injectable, OnInit } from '@angular/core';
import jsPDF from 'jspdf';
import { DataService } from './data.service';

@Injectable({
  providedIn: 'root'
})
export class PdfService {
  dure!:string
  result:string="Approuvé"
  formattedDate!:string 
  establishmentData:any
  agreementData:any 
  userData:any

  constructor( 
    private serviceData: DataService
  ) { }
  
  chercherDure(type:number) {
    if(type==1){
      this.dure="trois (3) mois"
    }else{
      this.dure="indétérminée"
    }  
    const date = new Date();
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    this.formattedDate = date.toLocaleDateString('fr-FR');
  }
  generateAgrementPDF() {
    this.establishmentData = this.serviceData.getEstablishmentData();
    this.agreementData = this.serviceData.getAgreementData();
    this.userData = this.serviceData.getUserData();
    this.chercherDure(this.agreementData.type_agrement_id);
    const margins = {
      top:30,
      right:10,
      bottom:30,
      left:10
    };
  
    function alaligne(number:number){
      margins.top += number;
    }
  
    const doc = new jsPDF;
  
    doc.setFontSize(14);
    doc.text('Repoblikan\'i Madagasikara', margins.left, margins.top);
    alaligne(15);
    doc.addImage(
      '../../../assets/drapo.png',
      'JPEG',
      margins.left + 10,
      margins.top - 10,
      40,
      40
    );
    alaligne(30);
    doc.setFontSize(10);
    doc.text('Fitiavana-Tanindrazana-Fandrosoana', margins.left, margins.top);
    alaligne(8);
    doc.setFont('courier');
    doc.setFontSize(9);
    doc.text('---Ministère de l\'Agriculture et de l\'élévage---', margins.left, margins.top);
    alaligne(4);
    doc.text('---Direction des services vétérinaire---', margins.left, margins.top);
    alaligne(4);
    doc.text('---Service d\'agrement des établissements à produits alimentaires dérivés animaux---', margins.left, margins.top);
    alaligne(20);
    doc.setFontSize(10);
    doc.text(`AGREMENT N° ${this.agreementData.numero}`, margins.left + 70, margins.top);
    alaligne(10);
    doc.setFontSize(9);
    var text = `        La présente Direction des Services Vétérinaire au sein de la quatrième république de Madagascar soussigne l'agrement ${this.agreementData.typeagrement.name} de durée ${this.dure} de l'établissement dénommé ${this.establishmentData.name} localisé à ${this.establishmentData.adresse}, dans la région xxx, district xxx qui a comme filière ${this.establishmentData.filiere.name}, à produit ${this.establishmentData.type_produit} de xxx appartenant Monsieur/Madame ${this.establishmentData.user[0].name}.`;
    var lines = doc.splitTextToSize(text, 180); // Diviser le texte en lignes de 100 points de large 
    doc.text(lines,margins.left,margins.top); 
    alaligne(30);
    doc.text('---A propos de l\'établissement---', margins.left, margins.top);
    alaligne(4);
    doc.text(`Nom : ${this.establishmentData.name}` , margins.left, margins.top);
    alaligne(4);
    doc.text(`Filière : ${this.establishmentData.filiere.name}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`Adresse : ${this.establishmentData.adresse}`, margins.left, margins.top);
    alaligne(8);
    doc.text(`Status après examen : ${this.result}`, margins.left, margins.top);
    alaligne(8);
    doc.text('---A propos du propriétaire---', margins.left, margins.top);
    alaligne(4);
    doc.text(`Nom : ${this.userData.name}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`Adresse : ${this.userData.userinformation.address}`, margins.left, margins.top);
    alaligne(8);
    doc.text(`Tel : ${this.userData.userinformation.tel}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`E-mail : ${this.userData.email}`, margins.left, margins.top);
    alaligne(8);
    doc.text('---A propos de l\'agrement---', margins.left, margins.top);
    alaligne(4);
    doc.text(`Numéro : ${this.agreementData.numero}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`Type : ${this.agreementData.typeagrement.name}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`Date de début : ${this.agreementData.date_debut}`, margins.left, margins.top);
    alaligne(4);
    doc.text(`Date de fin : ${this.agreementData.date_fin}`, margins.left, margins.top);
   
    doc.addImage(
      this.establishmentData.qrcode.toString(), // Utiliser l'image convertie en base64
      'JPEG',
      margins.left + 120,
      margins.top,
      40,
      40
    );
    alaligne(20);
    doc.text(`Responsable au sein de la\nDirection des Services Vétérinaire`, margins.left, margins.top);
    doc.text('Propriétaire de l\'établissement', margins.left + 120, margins.top);
    alaligne(25);
    doc.text(``, margins.left, margins.top);
    doc.text(``, margins.left + 120, margins.top);
    alaligne(5);
    doc.text(`Fait à Antananarivo, le ${this.formattedDate}`, margins.left + 120, margins.top);
  
    // Convertir le contenu du PDF en URL blob
    const pdfBlob = doc.output('bloburl');
  
    // Ouvrir une nouvelle fenêtre ou un nouvel onglet avec l'URL blob pour afficher le PDF
    window.open(pdfBlob, '_blank');
  
    // Vous n'avez plus besoin de la ligne ci-dessous pour télécharger le PDF
    // doc.save(`Agrement-${this.serviceData.agreementData.numero}.pdf`);
  }
}
