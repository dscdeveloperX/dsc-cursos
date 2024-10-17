import { HttpClient, HttpHeaders } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IUserResponse } from '../Models/IUserResponse';
import { UrlApiBase } from '../Constants/Url';
import { IUserRequest } from '../Models/IUserResquest';

@Injectable({
  providedIn: 'root'
})
export class UserRestService {


  private httpClient = inject(HttpClient);

   private headers:HttpHeaders = new HttpHeaders({
    'content-type':'application/json',
    'Authorization':'Bearer 9039bd63abcec9543915b9e626eb3273538569dda6407b3034f9548f31053d41'
  });

  constructor() { }

  public GetUserAll():Observable<IUserResponse[]>{
    return this.httpClient.get<IUserResponse[]>(`${UrlApiBase}users`, {headers:this.headers});
  }

  public GetUserById(id:number):Observable<IUserResponse>{
    return this.httpClient.get<IUserResponse>(`${UrlApiBase}users/${id}`,{headers:this.headers});
  }


  public PostUser(request:IUserRequest):Observable<IUserResponse[]>{
    return this.httpClient.post<IUserResponse[]>(`${UrlApiBase}users`, JSON.stringify(request),{headers:this.headers});
  }

  public PutUser(id:number, request:IUserRequest):Observable<IUserResponse[]>{
    return this.httpClient.put<IUserResponse[]>(`${UrlApiBase}users/${id}`, JSON.stringify(request),{headers:this.headers});
  }


  public DeleteUser(id:number):Observable<any>{
    return this.httpClient.delete<any>(`${UrlApiBase}users/${id}`,{headers:this.headers});
  }


}
