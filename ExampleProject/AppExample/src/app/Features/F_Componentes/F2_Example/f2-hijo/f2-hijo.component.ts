import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-f2-hijo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f2-hijo.component.html',
  styleUrls: ['./f2-hijo.component.css']
})
export class F2HijoComponent {


  @Input() Foto!:string;
  @Input() Nombre!:string;
  @Input() Descripcion!:string;

  

}
