import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  ControlContainer,
  FormControl,
  FormControlName,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';

@Component({
  selector: 'app-e3',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e3.component.html',
  styleUrls: ['./e3.component.css'],
})
export class E3Component {
  public formAnimal!: FormGroup;

  public ctrlNombre!: FormControl;
  public ctrlColor!: FormControl;

  constructor() {
    this.CrearFormAnimal();
  }



  private CrearFormAnimal() {
    //creamos instancias de los controles de formulario
    this.ctrlNombre = new FormControl(
      '',
      Validators.compose([Validators.required])
    );
    this.ctrlColor = new FormControl(
      '',
      Validators.compose([Validators.required])
    );

    //creamos una nueva instancia de formulario
    this.formAnimal = new FormGroup({
      Nombre: this.ctrlNombre,
      Color: this.ctrlColor,
    });
  }



  public EnviarFormAnimal(): void {
    if (this.formAnimal.valid) {
      console.log(this.formAnimal.value);
    }
  }
}
