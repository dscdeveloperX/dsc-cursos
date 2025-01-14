import { Component,signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductsRestService } from 'src/app/Core/Services/products-rest.service';
import { IproductResponse } from 'src/app/Core/Models/iproduct-response';

@Component({
  selector: 'app-product-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent {
  public ProductData = signal<IproductResponse[]>([]);

  constructor(private productRestService:ProductsRestService){

  }

  public ProductList():void{
    this.productRestService.GetProduct().subscribe({
      next: (data:IproductResponse[]) => {
        this.ProductData.set(data);
      }
    }
      
    );
  }

  public ProductId():void{
    this.productRestService.GetProductById(3).subscribe(
      {
        next:(response: IproductResponse)=>{
          this.ProductData.set([response]);

        }
      }
    )
  }

  public ProductFilter():void{
    this.productRestService.GetProductFilter(true,30,10.50).subscribe(
      {
        next:(response: IproductResponse[])=>{
          this.ProductData.set(response);

        }
      }
    );
  }

}
