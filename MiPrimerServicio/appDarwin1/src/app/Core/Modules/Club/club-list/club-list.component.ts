import { Component,signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ClubRestService } from 'src/app/Core/Services/club-rest.service';
import { IclubResponse } from 'src/app/Core/Models/iclub-response';

@Component({
  selector: 'app-club-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './club-list.component.html',
  styleUrls: ['./club-list.component.css']
})
export class ClubListComponent {
  public ClubData = signal<IclubResponse[]>([]);

  constructor(private clubRestService: ClubRestService){}

  public ClubLista():void {
    this.clubRestService.GetClub().subscribe({
      next: (data:IclubResponse[]) =>{
        this.ClubData.set(data);
      }
    });
  }

}
