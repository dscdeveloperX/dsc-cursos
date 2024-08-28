import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StylingcomponentComponent } from './stylingcomponent/stylingcomponent.component';


@Component({
  selector: 'app-componentsecret',
  standalone: true,
  imports: [CommonModule,StylingcomponentComponent],
  templateUrl: './componentsecret.component.html',
  styleUrls: ['./componentsecret.component.css']
})
export class ComponentsecretComponent {
 public animalesData:string[]=['tigre','leon','pantera nebulosa','caracal'];
 public AgregarAnimal():void{
let animal:string='acinonyx jubatus';
this.animalesData.push (animal);
 }
 public titulo = 'Hola Mundo';
 public Mostrar: boolean = true;
}
