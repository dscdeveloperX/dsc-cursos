import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';


@Component({
  selector: 'app-e13',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e13.component.html',
  styleUrls: ['./e13.component.css']
})
export class E13Component implements OnInit {
  
  //el signo "!" indica que los vamos a inicializar despues
  public formProducto!: FormGroup;
  public ctrlProductoNombre!: FormControl;
  public ctrlProductoPrecio!: FormControl;
  

  constructor() {
    this.CrearFormProducto();
  }

  ngOnInit(): void {
    
    //statusChanges: escuchar y reacciona a los cambios en el estado del formulario.

    this.ctrlProductoNombre.statusChanges.subscribe(estado=>{
      console.info('---ctrlProductoNombre cambio de estado ---');
      console.log(estado);
     });


    this.ctrlProductoNombre.valueChanges.subscribe(valores=>{
      console.info('---ctrlProductoNombre cambio de valores ---');
     console.log(valores);
    });


    
  }



  private CrearFormProducto(): void {
    //creamos instancias de los controles de formulario

    //formControl: productoNombre
    this.ctrlProductoNombre = new FormControl(
      '',
      Validators.compose([Validators.required])
    );

    //formControl: productoPrecio
    this.ctrlProductoPrecio = new FormControl(
      1,
      Validators.compose([Validators.required, Validators.min(1)])
    );

    //creamos una nueva instancia de formulario
    this.formProducto = new FormGroup({
      productoNombre: this.ctrlProductoNombre,
      productoPrecio: this.ctrlProductoPrecio,
    });

  }

  

  public EnviarFormProducto(): void {
    //pregunto si formulario es valido: osea que pase todas las validaciones
    if (this.formProducto.valid) {
      console.log(this.formProducto.value);
    }
  }



 


}
