import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { ICityGetAllResponse } from '../Models/City/icity-get-all-response';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CityService {


  constructor(private http:HttpClient) { 
  
  }

public GetCityAll():Observable<ICityGetAllResponse[]> {
  return this.http.get<ICityGetAllResponse[]>(`http://localhost:5170/api/v1/City/cities`);
}




}
