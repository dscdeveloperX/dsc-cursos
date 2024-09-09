import { Component } from '@angular/core';
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
  selector: 'app-e1',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e1.component.html',
  styleUrls: ['./e1.component.css'],
})
export class E1Component {
  
  //el signo "!" indica que los vamos a inicializar despues
  public formLogin!: FormGroup;
  public ctrlUsuario!: FormControl;
  public ctrlClave!: FormControl;


  constructor() {
    this.CrearFormLogin();
  }



  private CrearFormLogin(): void {
    //creamos instancias de los controles de formulario
    this.ctrlUsuario = new FormControl(
      '',
      Validators.compose([Validators.required])
    );
    this.ctrlClave = new FormControl(
      '',
      Validators.compose([Validators.required, Validators.minLength(6)])
    );

    //creamos una nueva instancia de formulario
    this.formLogin = new FormGroup({
      Usuario: this.ctrlUsuario,
      Clave: this.ctrlClave,
    });
  }

  public EnviarFormLogin(): void {
    if (this.formLogin.valid) {
      console.log(this.formLogin.value);
    }
  }
}
