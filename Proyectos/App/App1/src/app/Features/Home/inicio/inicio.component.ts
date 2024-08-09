import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SegundoComponent } from '../segundo/segundo.component';

@Component({
  selector: 'app-raiz',
  standalone: true,
  imports: [CommonModule,SegundoComponent],
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent {

}
