import { Component, OnInit, signal } from '@angular/core';
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
  CategoriaVideoControls,
  ICategoriaVideo,
  IVideo,
} from 'src/app/Core/Models/ivideo';

@Component({
  selector: 'app-e6',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './e6.component.html',
  styleUrls: ['./e6.component.css'],
})
export class E6Component implements OnInit {
  //campos
  public categoriaVideoData!: ICategoriaVideo[];

  private videoData: Partial<IVideo> = {};

  //formulario
  public formVideo!: FormGroup;
  public ctrlTitulo!: FormControl;
  public ctrlDuracion!: FormControl;
  public ctrlCategoria!: FormControl;

  constructor() {
    this.CargarCategoriaVideo();
  }

  //se ejecuta despues del constructor
  ngOnInit(): void {
    //creamos instancias de los controles de formulario
    this.ctrlTitulo = new FormControl(
      '',
      Validators.compose([Validators.required])
    );
    this.ctrlDuracion = new FormControl(
      1,
      Validators.compose([Validators.required, Validators.min(1)])
    );

    // Crear controles de formulario para cada categoría
    const categoriaVideoControls: CategoriaVideoControls =
      this.categoriaVideoData.reduce((acc, categoria) => {
        acc[categoria.categoriaId] = new FormControl(false);
        return acc;
      }, {} as CategoriaVideoControls);

    //creamos una nueva instancia de formulario
    this.formVideo = new FormGroup({
      Titulo: this.ctrlTitulo,
      Duracion: this.ctrlDuracion,
      ...categoriaVideoControls,
    });
  }

  public CargarCategoriaVideo(): void {
    this.categoriaVideoData = [
      {
        categoriaId: 'drm',
        categoriaNombre: 'Drama',
      },
      {
        categoriaId: 'cmd',
        categoriaNombre: 'Comedia',
      },
      {
        categoriaId: 'inf',
        categoriaNombre: 'Infantil',
      },
      {
        categoriaId: 'acc',
        categoriaNombre: 'Acción',
      },
    ];
  }

  public Enviar(): void {
    if (this.formVideo.valid) {
      //consola: formulario completo
      console.log("------- formulario video (completo) ------");
      console.log(this.formVideo.value);

      //filtro "categoriaVideoData" que es donde tengo cargada la lista de categorias de videos
      //el resto que lo explique el papito
      const categoriasSeleccionadas:ICategoriaVideo[] = this.categoriaVideoData.filter((item) => 
        this.formVideo.get(item.categoriaId)!.value === true
      );
      console.log("------- categorias Seleccionadas ------");
      console.log(categoriasSeleccionadas);


      this.videoData = {
        titulo: this.ctrlTitulo.value,
        duracion: this.ctrlDuracion.value,
        categoria: categoriasSeleccionadas,
      };
      //armamos a objeto a enviar

      console.log("------- cree un objeto a enviar ------");
      console.log(this.videoData);
    }
  }
}

//public videoData = signal<Partial<IVideo>>({});//partial nos evita tener que definir toda la estructura del objeto
