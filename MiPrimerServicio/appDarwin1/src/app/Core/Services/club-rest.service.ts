import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { IclubResponse } from '../Models/iclub-response';
import { IclubRequest } from '../Models/iclub-request';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClubRestService {

  constructor(private httpClient: HttpClient) { }

  public GetClub ():Observable<IclubResponse[]>{
    return this.httpClient.get<IclubResponse[]>(`http://localhost:5250/public/v2/Club`)
  }
}
