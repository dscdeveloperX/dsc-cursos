import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductsRestService } from 'src/app/Core/Services/products-rest.service';
import { IproductRequest } from 'src/app/Core/Models/iproduct-request';

@Component({
  selector: 'app-product-add',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-add.component.html',
  styleUrls: ['./product-add.component.css']
})
export class ProductAddComponent {
  constructor(private productsRestService:ProductsRestService){}

  public ProductAdd():void{

    let request:IproductRequest = {
      nombre: "Vaca de peluche",
      categoria: "juguetes",
      precio: 15.99,
      stock: 5,
      estado: false
      };

      this.productsRestService.PostProduct(request).subscribe(

        {
          next:(response:boolean)=>{
            alert(response)
          }
        }
      );




    }


  }

  


