export class Agrement {
    id: number; 
    status: string; 
    numero: string;  
    type_agrement_id:number;
    date_debut: string; 
    date_fin: string; 
    created_at:string;
    updated_at:string;

    constructor(){
        this.id=0;
        this.status="";
        this.numero="";
        this.type_agrement_id=0;
        this.date_debut="";
        this.date_fin="";
        this.created_at="";
        this.updated_at=""
    }
}