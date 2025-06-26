import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CityService } from 'src/app/Core/Services/city.service';
import { ICityGetAllResponse } from 'src/app/Core/Models/City/icity-get-all-response';

@Component({
  selector: 'app-generate',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './generate.component.html',
  styleUrls: ['./generate.component.css']
})
export class GenerateComponent implements OnInit {


  public cityData:ICityGetAllResponse[]= [];

  public constructor (private cityService:CityService){
  }

  ngOnInit(): void {
    this.GetCityAll();
  }


  public GetCityAll():void{
      this.cityService.GetCityAll().subscribe(
        {
          next: (data:ICityGetAllResponse[])=>{
              //console.log(data);
              this.cityData = data;
          }
        }
      );
  }

}
