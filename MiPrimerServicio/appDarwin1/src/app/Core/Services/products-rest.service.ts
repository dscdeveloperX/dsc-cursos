import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { IproductResponse } from '../Models/iproduct-response';
import { IproductRequest } from '../Models/iproduct-request';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsRestService {
private headers:HttpHeaders= new HttpHeaders(
  {"Content-Type":"application/json"}
);

  constructor(private httpClient: HttpClient) { 
  }

public GetProduct():Observable<IproductResponse[]> {
   return this.httpClient.get<IproductResponse[]>(`http://localhost:5250/public/v2/Productos`);
}

public GetProductById(id: number):Observable<IproductResponse>{
  return this.httpClient.get<IproductResponse>(`http://localhost:5250/public/v2/Productos/${id}`);
}

public GetProductFilter(estado: boolean, stock: number, precio:number ){
  return this.httpClient.get<IproductResponse[]>(`http://localhost:5250/public/v2/Productos/Estado/${estado}/Stock/${stock}/Precio/${precio}`)
}

public PostProduct (request: IproductRequest ):Observable<boolean>{
  return this.httpClient.post<boolean>(`http://localhost:5250/public/v2/Productos`, JSON.stringify(request) ,{headers:this.headers})
}

public PutProduct (id: number,request: IproductRequest ):Observable<boolean>{
  return this.httpClient.put<boolean>(`http://localhost:5250/public/v2/Productos/${id}`, JSON.stringify(request) ,{headers:this.headers})
}

public DeleteProduct (id: number ):Observable<boolean>{
  return this.httpClient.delete<boolean>(`http://localhost:5250/public/v2/Productos/${id}`)
}



}
