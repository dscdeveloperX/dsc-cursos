import { Component, OnDestroy, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { interval, Subscription } from 'rxjs';


@Component({
  selector: 'app-z2',
  standalone: true,
  imports: [CommonModule,FormsModule,ReactiveFormsModule],
  templateUrl: './z2.component.html',
  styleUrls: ['./z2.component.css'],
  
})
export class Z2Component implements OnDestroy  {
  public texto = signal<string>('this text will change soon');
  private timeout:any;

public Comenzar():void{
  this.timeout = setTimeout(
    () =>{this.texto.set('Nuevo Texto');},
    3000
  );
}
public Reiniciar():void{
  this.timeout= null;
  this.timeout= setTimeout(
    ()=>{this.texto.set('this text will change soon');},
    3000
  )
}

public Terminar():void{
  if(this.timeout != null) {
    clearTimeout(this.timeout);
  }
  else{
    alert('Porfavor iniciar timeout');
  }
}
 ngOnDestroy(): void {
   this.Terminar();
 }

  }
