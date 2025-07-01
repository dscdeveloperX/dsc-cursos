import { inject,Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IreportGetAllResponse } from '../Models/Report/ireport-get-all-response';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ReportService {

  constructor(private http: HttpClient) { }

public  GetReportAll(): Observable<IreportGetAllResponse[]>{
  return this.http.get<IreportGetAllResponse[]>(`http://localhost:5170/api/v1/ReportType/report-type`)
}

}
