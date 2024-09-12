import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-f3-hijo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f3-hijo.component.html',
  styleUrls: ['./f3-hijo.component.css']
})
export class F3HijoComponent {

  
  @Input() 
  public Foto!:string;

  @Input() 
  public Nombre!:string;

  @Input() 
  public Descripcion!:string;

  @Input() 
  public Poderes!:string[];



}
