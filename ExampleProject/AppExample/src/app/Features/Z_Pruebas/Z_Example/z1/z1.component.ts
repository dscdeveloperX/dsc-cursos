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
  public FormExample1!:FormGroup;

  constructor (){
    this.MetodoAnimales();

  }
   private MetodoAnimales():void{
    const ctrlNombre:FormControl= new FormControl('',[Validators.required,Validators.minLength(3)])
    this.FormExample1 = new FormGroup({
      nombre: ctrlNombre,
      especie: new FormControl('',[Validators.required]),
      estado: new FormControl('',[Validators.required])

    })

    }
     public EnviarInfo():void{
      if(this.FormExample1.valid){
        console.log(this.FormExample1.value)
      }
     }

   }

  

