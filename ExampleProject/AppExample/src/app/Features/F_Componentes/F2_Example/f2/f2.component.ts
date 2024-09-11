import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F2HijoComponent } from '../f2-hijo/f2-hijo.component';
import { IMiMascota } from 'src/app/Core/Models/ianimal';

@Component({
  selector: 'app-f2',
  standalone: true,
  imports: [CommonModule, F2HijoComponent],
  templateUrl: './f2.component.html',
  styleUrls: ['./f2.component.css']
})
export class F2Component {


  public misMascotaData = signal<IMiMascota[]>([]);




  public CargarMisMascotas():void{

    this.misMascotaData.set(
      [
        {
          foto:'gato.jpg',
          nombre:'Jose pepe',
          descripcion:'El gato mas mugroso que conozco'
        },
        {
          foto:'loro.jpg',
          nombre:'Rosendo',
          descripcion:'Pica el dedo de las personas asi que cuidate'
        },
        {
          foto:'perro.jpg',
          nombre:'Cafu animal',
          descripcion:'Es un perro guerrillero el unico sobreviviente'
        },
        {
          foto:'burro.jpg',
          nombre:'Igor',
          descripcion:'Era el burro mas tierno de la historia'
        }
      ]
    );


  }



}

