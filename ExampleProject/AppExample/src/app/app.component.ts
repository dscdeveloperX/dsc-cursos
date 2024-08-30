import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { A2Component } from './Features/A_DirectivaFor/A2_example/a2/a2.component';
import { A1Component } from './Features/A_DirectivaFor/A1_example/a1/a1.component';
import { A3Component } from './Features/A_DirectivaFor/A3_example/a3/a3.component';
import { A4Component } from './Features/A_DirectivaFor/A4_example/a4/a4.component';
import { A5Component } from './Features/A_DirectivaFor/A5_example/a5/a5.component';
import { B1Component } from './Features/B_DirectivaIf/B1_example/b1/b1.component';
import { B3Component } from './Features/B_DirectivaIf/B3_example/b3/b3.component';
import { C1Component } from './Features/C_EventoClick/C1_example/c1/c1.component';
import {RouterModule } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
}
