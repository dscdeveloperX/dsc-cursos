import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Igames } from 'src/app/Core/Models/igames';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-z1',
  standalone: true,
  imports: [CommonModule,FormsModule,ReactiveFormsModule],
  templateUrl: './z1.component.html',
  styleUrls: ['./z1.component.css']
})
export class Z1Component {
  public formJuego!: FormGroup;
  public ctrlNombre!: FormControl;
  public ctrlPUntuacion!: FormControl;
  constructor(){
    this.CrearFormulario();
  }
   
  private CrearFormulario():void{
    this.ctrlNombre= new FormControl('',Validators.compose([Validators.required]));
    this.ctrlPUntuacion= new FormControl('',Validators.compose([Validators.required,Validators.min(1)]));

    this.formJuego= new FormGroup({
      Nombre: this.ctrlNombre,
      Puntuacion: this.ctrlPUntuacion,
    })
  }
  public EnviarData():void{
    if(this.formJuego.valid){
      console.log(this.formJuego.value);
    }
  }

  public MostraControlValue():void{
    console.log('---Analisis del juego---');
    console.log('Titulo: ' + this.ctrlNombre.value);
    console.log('Puntaje: ' + this.ctrlPUntuacion.value);

  }
  public ModificarValor():void{
    console.log('---random---');
    this.ctrlNombre.setValue('Megaman Zero 3');
    this.ctrlPUntuacion.setValue(9.7);
  }
  
   }



  

