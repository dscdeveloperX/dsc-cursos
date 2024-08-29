import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IMascota } from 'src/app/Core/Models/imascota';

@Component({
  selector: 'app-tabla-mascota',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './tabla-mascota.component.html',
  styleUrls: ['./tabla-mascota.component.css']
})
export class TablaMascotaComponent {

  public mascotaData=signal<IMascota[]>([]);

  constructor()
  {
    this.mascotaData.set( [
      { 
      nombre:'kafu',
      color:'carbon',
      edad:44
    },
    {
      nombre:'risas',
      color:'beige',
      edad:24
    },
    {
      nombre:'inqui',
    color:'negra',
    edad:32
    }
    ]);
   

  }


}
