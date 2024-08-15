import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SegundoHijoComponent } from '../segundo-hijo/segundo-hijo.component';

@Component({
  selector: 'dsc-segundo',
  standalone: true,
  imports: [CommonModule,SegundoHijoComponent],
  templateUrl: './segundo.component.html',
  styleUrls: ['./segundo.component.css']
})
export class SegundoComponent {

}
