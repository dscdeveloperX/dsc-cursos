import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CityService } from 'src/app/Core/Services/city.service';
import { ICityGetAllResponse } from 'src/app/Core/Models/City/icity-get-all-response';
import { IreportGetAllResponse } from 'src/app/Core/Models/Report/ireport-get-all-response';
import { ReportService } from 'src/app/Core/Services/report.service';
import { AccountService } from 'src/app/Core/Services/account.service';
import { IAccountGetAllResponse } from 'src/app/Core/Models/Account/iaccount-get-all-response';

@Component({
  selector: 'app-generate',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './generate.component.html',
  styleUrls: ['./generate.component.css']
})
export class GenerateComponent implements OnInit {


  public cityData:ICityGetAllResponse[]= [];

  public reportTypeData: IreportGetAllResponse[]= [];

  public accountData: IAccountGetAllResponse[]= [];


  public constructor (
                      private cityService:CityService, 
                      private reportService: ReportService,
                      private accountService: AccountService){
  }

  ngOnInit(): void {
    this.OnGetCityAll();
    this.OnGetReportTypeAll();
    this.OnGetAccountAll();
  }

  private OnGetAccountAll():void {
    this.accountService.GetAccountAll().subscribe(
      {
        next: (data:IAccountGetAllResponse[])=>{
          this.accountData = data;

        }
      }
    )
  }





  private OnGetCityAll():void{


      this.cityService.GetCityAll().subscribe(
        {
          next: (data:ICityGetAllResponse[])=>{
              //console.log(data);
              this.cityData = data;
          }
        }
      );


  }

  private OnGetReportTypeAll():void{
    this.reportService.GetReportAll().subscribe(
      {
        next: (data:IreportGetAllResponse[])=>{
          this.reportTypeData = data;
        }
      }
    );
  }


public OnGetAccountId(id: number):void{
alert (id);

}



}
