import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { IAnimalRequest } from '../Models/ianimal-request';
import { IAnimalResponse } from '../Models/ianimal-response';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AnimalRestService {

  constructor(private httpClient: HttpClient) { }


public GetAnimal ():Observable< IAnimalResponse[]>
{
  return this.httpClient.get<IAnimalResponse[]>(`http://localhost:5250/public/v2/Animal`);
}

}
