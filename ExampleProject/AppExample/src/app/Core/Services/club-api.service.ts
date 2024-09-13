import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IClubResponse } from '../Models/iclub';
import { API_BASE_URL } from '../Constants/Url';

@Injectable({
  providedIn: 'root'
})
export class ClubApiService {

  constructor(private httpClient:HttpClient) { 
  }


  public getByIdClub(id:number):Observable<IClubResponse>{
    return this.httpClient.get<IClubResponse>(`${API_BASE_URL}/club/${id}`);
  }

  public getAllClub():Observable<IClubResponse>{
    return this.httpClient.get<IClubResponse>(`${API_BASE_URL}/club`);
  }

  public postClub():Observable<IClubResponse>{
    return this.httpClient.get<IClubResponse>(``);
  }

  public putClub():Observable<IClubResponse>{
    return this.httpClient.get<IClubResponse>(``);
  }

  public deleteClub():Observable<IClubResponse>{
    return this.httpClient.get<IClubResponse>(``);
  }
  


}
