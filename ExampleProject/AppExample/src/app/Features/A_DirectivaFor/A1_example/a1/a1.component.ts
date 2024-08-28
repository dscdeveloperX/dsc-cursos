import { Component, signal, WritableSignal } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-a1',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a1.component.html',
  styleUrls: ['./a1.component.css']
})
export class A1Component {

  public vocales:string[] = ['A','E','I','O','U'];
  public vocalesSignal1:WritableSignal<string[]> = signal<string[]>(['A-1','E-1','I-1','O-1','U-1']);
  public vocalesSignal2:any = signal<string[]>(['A-2','E-2','I-2','O-2','U-2']);
  public vocalesSignal3 = signal<string[]>(['A-3','E-3','I-3','O-3','U-3']);
  public vocalesSignal4 = signal(['A-4','E-4','I-4','O-4','U-4']);

  public vocalesSignal5 = signal<string[]>([]);


  public constructor(){
    this.vocalesSignal5.set(['A-5','E-5','I-5','O-5','U-5']);    
  }


}
