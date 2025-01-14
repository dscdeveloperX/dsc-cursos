import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { IproductResponse } from '../Models/iproduct-response';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsRestService {

  constructor(private httpClient: HttpClient) { }

public GetProduct():Observable<IproductResponse[]> {
   return this.httpClient.get<IproductResponse[]>(`http://localhost:5250/public/v2/Productos`);
}

public GetProductById(id: number):Observable<IproductResponse>{
  return this.httpClient.get<IproductResponse>(`http://localhost:5250/public/v2/Productos/${id}`);
}

public GetProductFilter(estado: boolean, stock: number, precio:number ){
  return this.httpClient.get<IproductResponse[]>(`http://localhost:5250/public/v2/Productos/Estado/${estado}/Stock/${stock}/Precio/${precio}`)
}
}
