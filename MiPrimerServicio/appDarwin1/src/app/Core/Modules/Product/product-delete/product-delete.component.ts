import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductsRestService } from 'src/app/Core/Services/products-rest.service';

@Component({
  selector: 'app-product-delete',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-delete.component.html',
  styleUrls: ['./product-delete.component.css']
})
export class ProductDeleteComponent {

  constructor(private productsRestService:ProductsRestService){

  }

  public Delete():void {
    this.productsRestService.DeleteProduct(3).subscribe(
    {
      next:(response:boolean)=>{
        alert(response);
      }
    }
  )
  }

}
