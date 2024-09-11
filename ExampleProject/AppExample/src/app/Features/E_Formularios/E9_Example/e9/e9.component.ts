import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-e9',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e9.component.html',
  styleUrls: ['./e9.component.css']
})
export class E9Component {


  public formGroup1!:FormGroup;

  public formAnimal!:FormGroup;
constructor(){
  this.CrearFormulario();
  this.CrearFormulario2();
}


private CrearFormulario():void{

  this.formGroup1 = new FormGroup(
    {
      nombre: new FormControl('a1'),
      apellido: new FormControl('b1')
    }
  );
  


}
private CrearFormulario2():void{

  const ctrlNombre:FormControl = new FormControl('',[Validators.required,Validators.minLength(3)]);
  
  this.formAnimal = new FormGroup(
    {
      nombre:ctrlNombre,
      raza: new FormControl('',[Validators.required]),
      color: new FormControl('',[Validators.required])
    }
  );

  
}

public EnviarFormulario():void{

  console.log(this.formGroup1.value);

}

public EnviarFormulario2():void{
  if(this.formAnimal.valid){
    console.log(this.formAnimal.value);
  }
  
}


}
