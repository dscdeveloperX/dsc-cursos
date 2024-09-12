import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-f1-hijo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f1-hijo.component.html',
  styleUrls: ['./f1-hijo.component.css']
})
export class F1HijoComponent {


  @Input() 
  public Foto!:string;
  
  @Input() 
  public Nombre!:string;

  @Input() 
  public Descripcion!:string;


}
