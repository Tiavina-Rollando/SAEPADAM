export class District{
    nom!:string;
    code!:number;
}
export class Region{
    nom!:string;
    district!: District[];    
}

