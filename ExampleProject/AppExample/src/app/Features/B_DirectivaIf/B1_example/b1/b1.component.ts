import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-b1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './b1.component.html',
  styleUrls: ['./b1.component.css']
})
export class B1Component {


  public visibleA:boolean;
  public visibleE:boolean;
  public visibleI:boolean;
  public visibleO = signal<boolean>(true);//con señales
  public visibleU = signal<boolean>(true);//con señales
  
  

  public constructor(){
    this.visibleA = true;
    this.visibleE = true;
    this.visibleI = true;
    this.visibleO.set(false);
    this.visibleU.set(false);
  }


}
