export interface IDeporte {
    patinaje:boolean;
    tenis:boolean;
    boxeo:boolean;
    
}

export interface IAficionado{
    nombreAficionado:string;
    deportes:IDeporte;
}

