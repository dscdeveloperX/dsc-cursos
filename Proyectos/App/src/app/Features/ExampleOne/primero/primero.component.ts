import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PrimeroHijoComponent } from '../primero-hijo/primero-hijo.component';

@Component({
  selector: 'dsc-primero',
  standalone: true,
  imports: [CommonModule,PrimeroHijoComponent],
  templateUrl: './primero.component.html',
  styleUrls: ['./primero.component.css']
})
export class PrimeroComponent {

}
