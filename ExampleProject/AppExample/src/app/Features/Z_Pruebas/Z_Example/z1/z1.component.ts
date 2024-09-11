import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Igames } from 'src/app/Core/Models/igames';

@Component({
  selector: 'app-z1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './z1.component.html',
  styleUrls: ['./z1.component.css']
})
export class Z1Component {
  
public RecorridoFor():void{
 
let x4:Igames[]=[
  {bestgame:'x4',console:'ps1',puntuacion:9.6}
]
 let worstgame:Igames={bestgame:'x7',console:'ps2',puntuacion:5}
 let both:Igames[]=[...x4 ,worstgame]



  }
  
}
