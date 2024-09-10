import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  ControlContainer,
  FormControl,
  FormControlName,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import {
  ICategoriaInstrumento,
  IInstrumento,
} from 'src/app/Core/Models/imusica';

@Component({
  selector: 'app-e6',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e6.component.html',
  styleUrls: ['./e6.component.css']
})
export class E6Component implements OnInit {

  public instrumentoFiltroData = signal<IInstrumento[]>([]);

  public instrumentoData!: IInstrumento[];
  public categoriaInstrumentoData!: ICategoriaInstrumento[];

  public formMusico!: FormGroup;
  public ctrlNombreMusico!: FormControl;
  public ctrlCategoriaInstrumentoId!: FormControl;
  public ctrlInstrumentoId!: FormControl;



  constructor(private changeDetectorRef:ChangeDetectorRef) {
    this.CrearFormMusico();
    this.CargarCategoriaInstrumento();
    this.CargarInstrumento();

  }


  ngOnInit(): void {

    
    //filtra instrumentos por categoria
    this.ctrlCategoriaInstrumentoId.valueChanges.subscribe((valor) => {
      const instrumentoFiltro:IInstrumento[] = this.instrumentoData.filter(
        item => item.categoriaInstrumentoId === valor
        
      );
      
      if(valor.length == 0 ){
        this.instrumentoFiltroData.set([]);  
      }else{
        this.instrumentoFiltroData.set(instrumentoFiltro);
      }
      
      

    });

  }



  private CargarInstrumento() {
    this.instrumentoData = [
      {
        instrumentoId: 'GUI',
        categoriaInstrumentoId: 'CUE',
        nombre: 'Guitarra',
      },
      {
        instrumentoId: 'VIO',
        categoriaInstrumentoId: 'CUE',
        nombre: 'Violín',
      },
      {
        instrumentoId: 'CEL',
        categoriaInstrumentoId: 'CUE',
        nombre: 'Cello',
      },
      {
        instrumentoId: 'ARP',
        categoriaInstrumentoId: 'CUE',
        nombre: 'Arpa',
      },
      {
        instrumentoId: 'TRO',
        categoriaInstrumentoId: 'VIE',
        nombre: 'Trompeta',
      },
      {
        instrumentoId: 'CLA',
        categoriaInstrumentoId: 'VIE',
        nombre: 'Clarinete',
      },
      {
        instrumentoId: 'FLA',
        categoriaInstrumentoId: 'VIE',
        nombre: 'Flauta',
      },
      {
        instrumentoId: 'SAX',
        categoriaInstrumentoId: 'VIE',
        nombre: 'Saxofón',
      },
      {
        instrumentoId: 'BAT',
        categoriaInstrumentoId: 'PER',
        nombre: 'Batería',
      },
      {
        instrumentoId: 'XIL',
        categoriaInstrumentoId: 'PER',
        nombre: 'Xilófono',
      },
      {
        instrumentoId: 'TAM',
        categoriaInstrumentoId: 'PER',
        nombre: 'Tambor',
      },
      {
        instrumentoId: 'TRI',
        categoriaInstrumentoId: 'PER',
        nombre: 'Triángulo',
      },
      {
        instrumentoId: 'PIA',
        categoriaInstrumentoId: 'TEC',
        nombre: 'Piano',
      },
      {
        instrumentoId: 'ORG',
        categoriaInstrumentoId: 'TEC',
        nombre: 'Órgano',
      },
      {
        instrumentoId: 'CLA',
        categoriaInstrumentoId: 'TEC',
        nombre: 'Clavicémbalo',
      },
    ];
  }

  private CargarCategoriaInstrumento() {
    this.categoriaInstrumentoData = [
      {
        categoriaInstrumentoId: 'CUE',
        nombre: 'Cuerda',
      },
      {
        categoriaInstrumentoId: 'VIE',
        nombre: 'Viento',
      },
      {
        categoriaInstrumentoId: 'PER',
        nombre: 'Percusión',
      },
      {
        categoriaInstrumentoId: 'TEC',
        nombre: 'Tecla',
      },
    ];
  }

  private CrearFormMusico(): void {
    this.ctrlNombreMusico = new FormControl(
      '',
      Validators.compose([Validators.required])
    );
    this.ctrlCategoriaInstrumentoId = new FormControl(
      '',
      Validators.compose([Validators.required])
    );
    this.ctrlInstrumentoId = new FormControl(
      '',
      Validators.compose([Validators.required])
    );

    this.formMusico = new FormGroup({
      nombre: this.ctrlNombreMusico,
      categoria: this.ctrlCategoriaInstrumentoId,
      instrumento: this.ctrlInstrumentoId,
    });
  }


  public EnviarFormMusico(){
if(this.formMusico.valid){
  console.log(this.formMusico.value);
}
  }

}
