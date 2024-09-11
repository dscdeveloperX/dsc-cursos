import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-e0',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e0.component.html',
  styleUrls: ['./e0.component.css']
})
export class E0Component {
  
  //el signo "!" indica que los vamos a inicializar despues
  public formProducto!: FormGroup;
  public ctrlProductoNombre!: FormControl;
  public ctrlProductoPrecio!: FormControl;
  

  constructor() {
    this.CrearFormProducto();
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


  public MostrarValoresControles():void{
    console.log('--- Mostrar valores de controles ---');
    console.log('ctrlProductoNombre = ' + this.ctrlProductoNombre.value);
    console.log('ctrlProductoPrecio = ' + this.ctrlProductoPrecio.value);
    //
    
  }

  public  ModificarValoresControles():void{
    console.log('--- valor de controles modificados ---');
    this.ctrlProductoNombre.setValue('Gelatina sabor a manzana');
    this.ctrlProductoPrecio.setValue(2.95);
  }

 


}
