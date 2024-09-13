export interface IClub{
    clubId:number;
    clubNombre:string;
    clubAlias:string;
    clubColor:string;
}

export interface IClubResponse{
    errorCodigo:number;
    errorMemsaje:string;
    data:IClub[];
}

export interface IClubInsertRequest{
    clubNombre:string;
    clubAlias:string;
    clubColor:string;
}

export interface IClubUpdateRequest{
    clubId:number;
    clubNombre:string;
    clubAlias:string;
    clubColor:string;
}

