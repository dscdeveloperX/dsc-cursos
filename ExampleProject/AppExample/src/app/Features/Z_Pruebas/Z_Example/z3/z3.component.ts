import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { Ibooks,ICategoriaLibros,CategoriaLibrosControls } from 'src/app/Core/Models/ibooks';


@Component({
  selector: 'app-z3',
  standalone: true,
  imports: [CommonModule,FormsModule,ReactiveFormsModule],
  templateUrl: './z3.component.html',
  styleUrls: ['./z3.component.css']
})
export class Z3Component implements OnInit {
  //campo de tipo array de interfaz 
  public categoriaLibrosData!: ICategoriaLibros[];
  //campo parcial de tipo interfaz
  private librosData: Partial<Ibooks>={};
// formgroup y dos forms controls
  public formBooks!: FormGroup;
  public ctrlTitulo!: FormControl;
  public ctrlPublicacion!: FormControl;
  constructor(){
    this.CargarCategoriaLibros();

  }
  ngOnInit(): void {
    this.CrearFormBooks();
  }
 private CrearFormBooks():void{
  this.ctrlTitulo= new FormControl('',Validators.required);
  this.ctrlPublicacion= new FormControl('',Validators.required);

  const categoriaLibrosControls: CategoriaLibrosControls = 
  this.categoriaLibrosData.reduce((acc,categoria)=>{
    acc[categoria.categoriaId] = new FormControl(false);
    return acc;
  }, {} as CategoriaLibrosControls)
   
  this.formBooks = new FormGroup({
    Titulo: this.ctrlTitulo,
    Publicacion: this.ctrlPublicacion,
    ...categoriaLibrosControls,
  });

 }

 public CargarCategoriaLibros():void{
  //se llena categoriaLibrosData de acuerdo a su interfaz
  this.categoriaLibrosData =[
    {
      categoriaId:'fcc',
      categoriaNombre: 'Ficcion'
    },
    {
      categoriaId: 'inf',
      categoriaNombre: 'Infantil'
    },
  ];
 }
 
 public EnviarFormLibros():void{
  //si este grupo de formulario es valido se mostrara este mensaje y los valores
  if(this.formBooks.valid){
    console.log('---formulario libros completo---');
    console.log(this.formBooks.value);
//creamos una constante con tipo de interfaz 
    const categoriasSeleccionadas: ICategoriaLibros[]=
    //la igualamos al campo categoriaLibrosData con un filtro
    this.categoriaLibrosData.filter(
      //item es igual a 
      (item)=> this.formBooks.get(item.categoriaId)!.value === true
    );
     console.log('---categorias seleccionadas---');
     console.log(categoriasSeleccionadas);

     this.librosData = {
      titulo: this.ctrlTitulo.value,
      publicacion: this.ctrlPublicacion.value,
      categoria: categoriasSeleccionadas,
     };
      

     console.log('---cree un objeto a enviar---')
     console.log(this.librosData);

  }
 }
  

}

