export interface IClub{
    clubId:number;
    clubNombre:string;
    clubAlias:string;
    clubColor:string;
}

export interface IClubResponse{
    errorCodigo:number;
    errorMemsaje:string;
    clubes:IClub[];
}

export interface IClubAddModRequest{
    clubId?:number;
    clubNombre:string;
    clubAlias:string;
    clubColor:string;
}

