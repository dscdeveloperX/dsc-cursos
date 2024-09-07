import { FormControl } from "@angular/forms";

export interface IVideo {
    titulo:string;
    duracion:number;
    categoria:ICategoriaVideo[];
}


export interface ICategoriaVideo{
    categoriaId:string;
    categoriaNombre:string;    
}

export interface CategoriaVideoControls {
    [key: string]: FormControl;
  }