import { FormControl } from "@angular/forms";
export interface Ibooks {
    titulo:string;
    publicacion:string;
    categoria: ICategoriaLibros[];
    
}
 export interface ICategoriaLibros{
    categoriaId:string;
    categoriaNombre:string;
 }
 export interface CategoriaLibrosControls {
    [key: string]: FormControl;
 }
