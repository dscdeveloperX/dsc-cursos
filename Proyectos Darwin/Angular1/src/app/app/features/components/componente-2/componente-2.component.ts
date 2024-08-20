import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ComponentebetaComponent } from './componentebeta/componentebeta.component';

@Component({
  selector: 'app-componente-2',
  standalone: true,
  imports: [CommonModule,ComponentebetaComponent],
  templateUrl: './componente-2.component.html',
  styleUrls: ['./componente-2.component.css']
})
export class Componente2Component {

}
