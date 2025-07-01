import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IAccountGetAllResponse } from '../Models/Account/iaccount-get-all-response';


@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(private httpClient: HttpClient) { }

  public GetAccountAll():Observable<IAccountGetAllResponse[]>{

return this.httpClient.get<IAccountGetAllResponse[]>(`http://localhost:5170/api/v1/Account/account`);
  }

}
