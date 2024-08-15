import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DscForComponent } from './Features/ExampleOne/dsc-for/dsc-for.component';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule,DscForComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'App';
}
