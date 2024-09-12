import { Component, signal, Signal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-exercises',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './exercises.component.html',
  styleUrls: ['./exercises.component.css']
})
export class ExercisesComponent {
public letras:string[]= ['a','b','c','d','e']
public juegos = signal<string[]>(['donkey kong 2','donkey kong 1','mario world','megaman x'])
public FemaleNames = signal<string[]>([])

public constructor() {
 this.FemaleNames.set(['Jennifer','Zuleyka','Emma',]);
}
public Data:any = [
 {
  Nombre:'Darwin',
  Fecha: new Date('2004-02-02T02:15:00Z'),
  Edad: 20

 }



];
}
