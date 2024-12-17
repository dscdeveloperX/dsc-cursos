import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimalListComponent } from './Core/Modules/animal-list/animal-list.component';
import { RouterModule } from '@angular/router';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'appDarwin1';
}
