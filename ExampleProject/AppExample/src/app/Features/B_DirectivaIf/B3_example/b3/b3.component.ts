import { ChangeDetectionStrategy, Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-b3',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './b3.component.html',
  styleUrls: ['./b3.component.css'],
  changeDetection:ChangeDetectionStrategy.OnPush
})
export class B3Component {


  public onOff1 = signal<boolean>(true);
  


  public MostrarMensaje():void {
    this.onOff1.set(true);
  }

  public OcultarMensaje():void {
    this.onOff1.set(false);
  }


  public OcultarMostrarMensaje(){
    //le asigno a la variable onOff1 su propio valor
    //pero el signo "!" que significa indistinto hace que si onOff1 es true este se vuelva false y viceversa
    this.onOff1.set( !this.onOff1() );
  }


}
