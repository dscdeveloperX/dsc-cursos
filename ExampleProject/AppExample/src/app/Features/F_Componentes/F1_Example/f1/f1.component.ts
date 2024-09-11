import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F1HijoComponent } from '../f1-hijo/f1-hijo.component';


@Component({
  selector: 'app-f1',
  standalone: true,
  imports: [CommonModule, F1HijoComponent],
  templateUrl: './f1.component.html',
  styleUrls: ['./f1.component.css']
})
export class F1Component {

 public foto1:string = 'perro.jpg';
 public nombre1:string = 'Cafu Animal';
 public descripcion1:string = 'Perro combatiente ahuuu';
 


}
