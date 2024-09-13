import { afterNextRender, Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ClubApiService } from 'src/app/Core/Services/club-api.service';
import { IClub, IClubResponse } from 'src/app/Core/Models/iclub';

@Component({
  selector: 'app-g1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './g1.component.html',
  styleUrls: ['./g1.component.css']
})
export class G1Component implements OnInit {


  public ClubData = signal<IClub[]>([]);


  constructor(private clubApiService:ClubApiService){
  }



  ngOnInit(): void {
    this.ListaTodoClub();
  }




  private ListaTodoClub():void{
    this.clubApiService.getAllClub().subscribe(
      {
        next:(response:IClubResponse)=>{

              this.ClubData.set(response.data);
        },
        error:(e)=>{
          console.error(e);
        },
        complete:()=>{
          console.info('transaccion exitosa');
        }
      }
    );
  }



  public Actualizar(id:number):void{
    alert('actualiar id:' + id );
  }

  public Eliminar(id:number):void{
    alert('eliminar id:' + id );
  }


}
