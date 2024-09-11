import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F3HijoComponent } from '../f3-hijo/f3-hijo.component';


@Component({
  selector: 'app-f3',
  standalone: true,
  imports: [CommonModule, F3HijoComponent],
  templateUrl: './f3.component.html',
  styleUrls: ['./f3.component.css']
})
export class F3Component {

  public foto1:string = 'perro.jpg';
  public nombre1:string = 'Cafu Animal';
  public descripcion1:string = 'Perro combatiente ahuuu';
  public poderes1:string[] = ['Fuerte', 'Bueno', 'Lindo', 'Chancho', 'Loquiño'];

 

}
