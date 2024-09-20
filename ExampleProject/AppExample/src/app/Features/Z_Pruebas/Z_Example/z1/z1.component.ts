import { Component, OnInit } from '@angular/core';
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
 
export class Z1Component implements OnInit {
  //se implementa OnInit en la clase principal
  //saldra un error hasta que pongamos el metodo de abajo con ese nombre
 ngOnInit(): void {
  //status change y value change se puede hacer tambien con los controles individuales en vez de con todo el formulario
  //esto lo hace mas especifico
  this.ctrlNombre.statusChanges.subscribe(estado=>{console.info('---ctrlNombre ha cambiado de estado---');
    console.log(estado);
  })
  this.ctrlNombre.valueChanges.subscribe(valor=>{console.info('---ctrlNombre ha cambiado de valor');
    console.log(valor);
  })
  //status change y value change con el segundo controlador
  this.ctrlPUntuacion.statusChanges.subscribe(estado=>{console.info('---ctrlPuntuacion ha cambiado de estado---');
    console.log(estado);
  })
  this.ctrlPUntuacion.valueChanges.subscribe(valor=>{console.info('---ctrlPUntuacion ha cambiado de valor')
    console.log(valor);
  })
  

 }




  //-----------
  //dentro de la clase van los campos que formaran los controles y el grupo de formulario
  //tienen un signo en el nombre que hace que no salga error mientras no usemos los campos
  public formJuego!: FormGroup;
  public ctrlNombre!: FormControl;
  public ctrlPUntuacion!: FormControl;
  constructor(){
    //en el constructor va el metodo que contiene el proceso de creacion del grupo del formulario y sus controles
    this.CrearFormulario();
  }
   
  private CrearFormulario():void{
    //nueva instancia de los FormControl en los campos que creamos
    //primero se introduce el valor por default que mostrara el control de entrada
    //despues las validaciones (explicacion)
    this.ctrlNombre= new FormControl('',Validators.compose([Validators.required]));
    this.ctrlPUntuacion= new FormControl('',Validators.compose([Validators.required,Validators.min(1)]));
    //dentro del formGroup van nuestro controladores 
    //se les asigna un nombre de referencia (explicacion)
    this.formJuego= new FormGroup({
      Nombre: this.ctrlNombre,
      Puntuacion: this.ctrlPUntuacion,
    })
  }
  public EnviarData():void{
    //metodo que sera usado en el submit del formulario
    //por medio de un IF si nuestro formulario es valido entonces se muestran sus valores en consola gracias a .value
    //se los mostrara en formato json
    if(this.formJuego.valid){
      console.log(this.formJuego.value);
    }
  }

  public MostraControlValue():void{
    //metodo que muestra el valor de los controladores en la consola pero en formato texto
    console.log('---Analisis del juego---');
    console.log('Titulo: ' + this.ctrlNombre.value);
    console.log('Puntaje: ' + this.ctrlPUntuacion.value);

  }

  public ModificarValor():void{
    //muestra un valor predeterminado en los controles por medio de .setValue
    console.log('---random---');
    this.ctrlNombre.setValue('Megaman Zero 3');
    this.ctrlPUntuacion.setValue(9.7);
  }
  
   }



  

