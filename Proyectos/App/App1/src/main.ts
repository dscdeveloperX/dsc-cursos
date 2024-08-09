import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { InicioComponent } from './app/Features/Home/inicio/inicio.component';

bootstrapApplication(InicioComponent, appConfig)
  .catch((err) => console.error(err));
