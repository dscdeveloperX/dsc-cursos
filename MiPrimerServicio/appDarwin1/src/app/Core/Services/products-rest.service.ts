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

}
