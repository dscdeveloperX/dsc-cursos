export interface IEmpleado{
    cedula:string;
    nombre:string;
    sueldo:string;
    hijos:IHijos;
}


export interface IHijos{
    hijoNombre:string;
    hijoEdad:number;
}