import {
  Component,
  ElementRef,
  Input,
  Renderer2,
  ViewChild,
} from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-f7',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './f7.component.html',
  styleUrls: ['./f7.component.css'],
})
export class F7Component {
  

  @ViewChild('miDiv')
  public miDiv!: ElementRef;

  @ViewChild('miImg')
  public miImg!: ElementRef;

  @ViewChild('miInput')
  public miInput!: ElementRef;
  //



  constructor(private renderer: Renderer2) {
  }



  public AgregarEstilo(): void {
    let etiqueta = this.miDiv.nativeElement;
    this.renderer.setStyle(etiqueta, 'color', 'red');
    this.renderer.setStyle(etiqueta, 'background-color', 'yellow');
  }

  public EliminarEstilo(): void {
    let etiqueta = this.miDiv.nativeElement;
    this.renderer.removeStyle(etiqueta, 'color');
    this.renderer.removeStyle(etiqueta, 'background-color');
  }

  public AgregarClase(): void {
    let etiqueta = this.miDiv.nativeElement;
    this.renderer.addClass(etiqueta, 'estilo');
  }
  public EliminarClase(): void {
    let etiqueta = this.miDiv.nativeElement;
    this.renderer.removeClass(etiqueta, 'estilo');
  }

  public AgregarAtributo(): void {
    let etiqueta = this.miImg.nativeElement;
    this.renderer.setAttribute(etiqueta, 'title', 'este es un atributo');
    alert('Acerca el mouse a la imagen y podrás ver el mensaje "este es un atributo"');
  }
  public EliminarAtributo(): void {
    let etiqueta = this.miImg.nativeElement;
    this.renderer.removeAttribute(etiqueta, 'title');
  }

  public AgregarPropiedad(): void {
    let etiqueta = this.miInput.nativeElement;
    this.renderer.setProperty(etiqueta, 'type', 'date');
  }

  
}
