import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Componente1Component } from './app/features/components/componente1/componente1.component';
import { Componente2Component } from './app/features/components/componente-2/componente-2.component';
import { ComponentroisComponent } from './app/features/components/componentrois/componentrois.component';
import { ComponentsecretComponent } from './app/features/components/componentsecret/componentsecret.component';



@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule,Componente1Component,Componente2Component,ComponentroisComponent,ComponentsecretComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Angular1';
}
