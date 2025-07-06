import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AccountService } from 'src/app/Core/Services/account.service';
import { IAccountGetAllResponse } from 'src/app/Core/Models/Account/iaccount-get-all-response';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-report',
  standalone: true,
  imports: [CommonModule,FormsModule, ReactiveFormsModule],
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css']
})
export class ReportComponent implements OnInit {

public formPrincipal!: FormGroup;
public ctrlAccountId!: FormControl;
public ctrlStarDate!: FormControl;
public ctrlEndDate!: FormControl;




 public accountData: IAccountGetAllResponse[]= [];

  ngOnInit(): void {
    this.ctrlAccountId = new FormControl("",Validators.required);
    this.ctrlStarDate = new FormControl("",Validators.required);
    this.ctrlEndDate = new FormControl("",Validators.required);

    this.formPrincipal = new FormGroup(
     {
    accountId: this.ctrlAccountId,
    starDate: this.ctrlStarDate,
    endDate: this.ctrlEndDate
    }
    );

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
this.ctrlAccountId.setValue(id);

}


public OnSubmit():void{
  console.info(this.formPrincipal.value);

}
  

}
