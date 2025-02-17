export class Demand {
    idDemande!: number;
    numeroDemande!: string; 
    departement!: string; 
    nomEtablissement!: string; 
    etatDemande!: string; 
    typeAgrement!: string;
    createdDate!:string;
    modifiedDate!:string;

    constructor(){
        this.idDemande=0;
        this.numeroDemande="";
        this.departement="";
        this.nomEtablissement="";
        this.etatDemande="";
        this.typeAgrement="";
        this.createdDate="";
        this.modifiedDate=""
    }
}