import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ControlContainer, FormControl, FormControlName, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { IListas } from 'src/app/Core/Models/ilistas';

@Component({
  selector: 'app-e5',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e5.component.html',
  styleUrls: ['./e5.component.css']
})
export class E5Component implements OnInit {



  public autoData = signal<IListas[]>([]);
  public gatoData = signal<IListas[]>([]);


  public formPersona:FormGroup;

  public ctrlNombre:FormControl;
  public ctrlGato:FormControl;
  public ctrlAuto:FormControl;
  

  constructor(){

    //creamos instancias de los controles de formulario
    this.ctrlNombre = new FormControl('', Validators.compose([Validators.required]));
    this.ctrlGato = new FormControl('', Validators.compose([Validators.required]));
    this.ctrlAuto = new FormControl('', Validators.compose([Validators.required]));
  
  
    //creamos una nueva instancia de formulario
    this.formPersona = new FormGroup(
      {
        Nombre:this.ctrlNombre,
        Gato:this.ctrlGato,
        Auto:this.ctrlAuto
      }
    );

  }


  ngOnInit(): void {

    //llenamos lista de autos
    this.autoData.set(
      [
        { valor:'F1', texto:'Maclaren 58'  },
        { valor:'CH',texto:'Chevrolet'   },
        { valor:'TO', texto:'Toyota'  }
      ]
    );


    //llenamos lista de gatos
    this.gatoData.set(
      [
        { valor:'ANG', texto:'Angora'  },
        { valor:'SIA',texto:'Siames'   },
        { valor:'MEX', texto:'Mexicano'  }
      ]
    );
    
  }



  
  public Enviar():void{

    if(this.formPersona.valid){
          console.log(this.formPersona.value);
    
    }

  }


}
