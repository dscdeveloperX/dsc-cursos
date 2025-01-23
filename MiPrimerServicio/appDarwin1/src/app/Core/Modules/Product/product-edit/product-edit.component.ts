import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductsRestService } from 'src/app/Core/Services/products-rest.service';
import { IproductRequest } from 'src/app/Core/Models/iproduct-request';

@Component({
  selector: 'app-product-edit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-edit.component.html',
  styleUrls: ['./product-edit.component.css']
})
export class ProductEditComponent {

  constructor(private productsRestService:ProductsRestService){

  }

  public Editar():void{
    const request:IproductRequest={
      
        nombre: "Cepillo Dental",
        categoria: "Hogar",
        precio: 1.99,
        stock: 25,
        estado: false
      
    };


    this.productsRestService.PutProduct(4,request).subscribe(
      {
        next : (response: boolean)=>{
          alert(response);
        }
      }
    )

  }

}
