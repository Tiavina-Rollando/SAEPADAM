
interface user{
    id:number;
    name:string;
    email:string;
    tel:string;
    address:string;
    matricule:string;
}
interface agrement{
    id: number,
    numero: string,
    status: boolean,
    type_agrement_id: 0,
    date_debut: string,
    date_fin: string,
    created_at: string,
    updated_at: string,
    pivot: {
        etablissement_id: 0,
        agrement_id: 0
    }
}
export class Etablissement {
    id: number;
    name: string;
    filiere: string;
    commune: string;
    veterinaire:string;
    veterinaires:user;
    filiere_id:number;
    type_activite_id:number;
    type_etablissement:string;
    adresse:string;
    region:string;
    district:string;
    type_produit:string;
    created_at: string;
    updated_at: string;
    type_activite:{
        id:number;
        name:string;
        created_at: string;
        updated_at: string;
    };
    user:user[];
    agrement: agrement[];
    demandeagrement : any[];
    pivot : {
        user_id : number,
        etablissement_id : number
    }
    constructor(){
        this.id=0;
        this.name="";
        this.filiere="";
        this.commune="";
        this.veterinaire="";
        this.veterinaires={
            id:0,
            name:"",
            email:"",
            tel:"",
            matricule:"",
            address:"",
        }
        this.filiere_id=0;
        this.type_activite_id=0;
        this.created_at="";
        this.updated_at="";
        this.adresse="";
        this.region="";
        this.district="";
        this.type_produit="";
        this.user=[];
        this.type_etablissement="";
        this.type_activite={
            id:0,
            name:"",
            created_at: "",
            updated_at: "",   
        };
        this.pivot = {
            user_id : 0,
            etablissement_id : 0
        }
        this.agrement=[];
        this.demandeagrement=[]
    }
    
}