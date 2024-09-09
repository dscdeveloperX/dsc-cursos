import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormControl, FormControlName, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';


@Component({
  selector: 'app-e8',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e8.component.html',
  styleUrls: ['./e8.component.css']
})
export class E8Component  implements OnInit {

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


  public EnviarFormPadre():void{}



  
}
