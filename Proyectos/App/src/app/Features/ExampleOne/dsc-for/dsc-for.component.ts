import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-dsc-for',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './dsc-for.component.html',
  styleUrls: ['./dsc-for.component.css']
})
export class DscForComponent {
  
  public ingredientesData:string[] =['cebolla','tomate','pepino','perejil','apio','comino'];


  public AgregarIngrediente():void{
    let ingrediente:string='pepinillo';
    this.ingredientesData.push(ingrediente);
  }


}
