import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AccountService } from 'src/app/Core/Services/account.service';
import { IAccountGetAllResponse } from 'src/app/Core/Models/Account/iaccount-get-all-response';

@Component({
  selector: 'app-report',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css']
})
export class ReportComponent implements OnInit {

 public accountData: IAccountGetAllResponse[]= [];

  ngOnInit(): void {
    this.OnGetAccountAll();
  }

  public constructor(private accountService:AccountService){
    
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

  public OnGetAccountId(id: number):void{
alert (id);

}
  

}
