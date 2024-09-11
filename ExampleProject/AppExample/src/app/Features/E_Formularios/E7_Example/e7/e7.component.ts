import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormControl, FormControlName, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-e7',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e7.component.html',
  styleUrls: ['./e7.component.css']
})
export class E7Component implements OnInit {

  //formulario padre
  public formPadre!:FormGroup;
  public ctrlPadreNombre!:FormControl;
  public ctrlPadreSueldo!:FormControl;
  


  ngOnInit(): void {

    //iniciamos formulario padre
    this.CrearFormPadre();

  }


  
  private CrearFormPadre():void{

    //inicializamos controles padre
    this.ctrlPadreNombre = new FormControl('',Validators.compose([Validators.required]));
    this.ctrlPadreSueldo = new FormControl(0,Validators.compose([Validators.required, Validators.min(1)]));
  
    //inicializamos formulario padre
    this.formPadre = new FormGroup({
      padreNombre:this.ctrlPadreNombre,
      padreSueldo:this.ctrlPadreSueldo,
      padreHijos:new FormArray([], Validators.required)
    });

  }



  private get NuevoFormHijo():FormGroup{
    //devuelve una copia o nueva instancia de un formulario que será el nuevo formulario hijo
    return new FormGroup({
      hijoNombre: new FormControl('',Validators.compose([Validators.required])),
      hijoEdad: new FormControl(0,Validators.compose([Validators.required, Validators.min(0)]))
    });

  }


public get FormArrayPadreHijos(): FormArray{
  //devuleve una referencia al formArray "padreHijos" del formulario "formPadre"
   return this.formPadre.get('padreHijos') as FormArray;
}


public AgregarFormularioHijo():void{
  //agregamos al array un nuevo formulario
  this.FormArrayPadreHijos.push(this.NuevoFormHijo);

}


public EliminarFormularioHijo(indice:number):void{
  //eliminamos del array el elemento del indice indicado
  this.FormArrayPadreHijos.removeAt(indice);

}


public ResetearFormularios():void{
  
  //eliminamos todos los elementos del array a partir del indice 0
  this.FormArrayPadreHijos.controls.splice(0, this.FormArrayPadreHijos.length);
  //limpiamos los valores del formulario
  this.formPadre.reset();
}



public Enviar():void{
  console.log(this.formPadre.value);
}


}
