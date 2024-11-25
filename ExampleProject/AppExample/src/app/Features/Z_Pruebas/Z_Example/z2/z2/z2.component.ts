import { Component, OnDestroy, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';



@Component({
  selector: 'app-z2',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './z2.component.html',
  styleUrls: ['./z2.component.css'],
  
})
export class Z2Component  {
  public nombre:string;
  private apellido!:string;
  constructor(){
    this.nombre= 'Darwin';
    this.apellido= 'Sanchez';
    
  }

  


  }
