interface roles{
    id: number;
    name: string;
    guard_name: string;
    created_at: string;
    updated_at: string;
    pivot: {
        model_type: string;
        model_id: number;
        role_id: number
    }
}
export class User {
    id:number;
    name:string;
    email:string;
    email_verified_at:string;
    created_at:string;
    updated_at:string;
    roles: roles[];
    etablissement: [];
    password:string;
    userinformation: {
        id:number;
        user_id: number;
        tel: string;
        address: string;
        matricule: string;
        created_at: string,
        updated_at: string
    }
    constructor(){
        this.id=0;
        this.name="";
        this.email="";
        this.email_verified_at="";
        this.created_at="";
        this.updated_at="";
        this.roles=[];
        this.password=""
        this.etablissement=[];
        this.userinformation={
            id:0,
            user_id: 0,
            tel: "",
            address: "",
            matricule: "",
            created_at: "",
            updated_at: "",   
        }
    }
}