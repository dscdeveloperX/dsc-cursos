import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import{
  Igames,
  IgamesFranquicia,
  IgamesTipo,
} from 'src/app/Core/Models/igames';
@Component({
  selector: 'app-z1',
  standalone: true,
  imports: [CommonModule,FormsModule,ReactiveFormsModule],
  templateUrl: './z1.component.html',
  styleUrls: ['./z1.component.css']
})
 
export class Z1Component implements OnInit {
 
 
  
  
  //formulario padre
  public formFranquicia!:FormGroup;
  //controles nuevos
  public ctrlFranquiciaId!:FormControl;
  public ctrlTipoGameId!:FormControl;
  //creacion de formFranquicia
  private CrearFormFranquicia():void{
    this.ctrlFranquiciaId= new FormControl('',Validators.compose([Validators.required]));
    this.ctrlTipoGameId= new FormControl('',Validators.compose([Validators.required]));
     
    this.formFranquicia= new FormGroup({
      franquicia: this.ctrlFranquiciaId,
      tipo: this.ctrlTipoGameId,
      franquiciaJuegos: new FormArray([],Validators.required)
    });
  }
  //devuelve una copia de un formulario que servira de plantilla
  public get NuevoFormJuegos(){
    return new FormGroup({
      juegoNombre: new FormControl('',Validators.compose([Validators.required])),
      juegosPuntuacion: new FormControl(0,Validators.compose([Validators.required,Validators.min(0)]))
    })
  }
  //devuelve el array
  public get FormArrayFranquiciaJuegos(): FormArray{
    return this.formFranquicia.get('franquiciaJuegos') as FormArray;
  }
  //agregamos el array a un nuevo formulario
  public AgregarFormJuego():void{
    this.FormArrayFranquiciaJuegos.push(this.NuevoFormJuegos);
  }
  

  //controles del filtro del form Franquicia
  public gamesFiltroData = signal<IgamesTipo[]>([])
  public gamesFiltroData2 = signal<Igames[]>([])
  public gamesData!: Igames[];
  public tipoGamesData!: IgamesTipo[];
  public franquiciaData!: IgamesFranquicia[];

  ngOnInit(): void {
    this.ctrlFranquiciaId.valueChanges.subscribe((valor)=>{
      const juegosFiltro: IgamesTipo[] = this.tipoGamesData.filter(
        item => item.gamesFranquiciaId === valor
      );

      if(valor.length ==0){
        this.gamesFiltroData.set([]);
      } else{
        this.gamesFiltroData.set(juegosFiltro);
        
      }
      this.ctrlTipoGameId.setValue('')
      

    });
    this.ctrlTipoGameId.valueChanges.subscribe((valor)=>{
      const games: Igames[]= this.gamesData.filter(
        item => item.gamesTipoId === valor
      );
       if(valor.length==0){
        this.gamesFiltroData2.set([]);
       }else{
        this.gamesFiltroData2.set(games)
       }
      
    })
    //this.NuevoFormJuegos.get('juegoNombre')?.setValue('')
    this.FormArrayFranquiciaJuegos.get('juegoNombre')?.setValue('')
    }
  
  
  
  //igamesTipo interface
   private CargarTipoJuego(){
    this.tipoGamesData=[
      { gamesFranquiciaId: 'MM',
        gamesTipoId: 'MMC',
        nombre: 'Megaman Classic',
      },
     
    ];
   }
   //igamesFranquicia interface
   private CargarFranquicia(){
    this.franquiciaData=[
      {
        gamesFranquiciaId: 'MM',
        nombre: 'Megaman'
      }
    ]
   }
   //el contructor
   constructor(){
    this.CrearFormFranquicia();
    this.CargarFranquicia();
    this.CargarTipoJuego();
    this.CargarJuegos();
   }
   //igames interface
  private CargarJuegos(){
    this.gamesData=[
      {
        gamesId: 'MM1',
        gamesTipoId:'MMC' ,
        nombre: 'Megaman 1',

      },
      {
        gamesId: 'MM2',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 2',
      },
      {
        gamesId: 'MM3',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 3',
      },
      {
        gamesId: 'MM4',
        gamesTipoId:'MMC',
        nombre: 'Megaman 4',
      },
      {
        gamesId: 'MM5',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 5',
      },
      {
        gamesId: 'MM6',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 6',
      },
     
    ];
  }
  //enviar info del form
 public Enviar():void{
  console.log(this.formFranquicia.value);
 }

 public ResetearForm():void{
  this.FormArrayFranquiciaJuegos.controls.splice(0,this.FormArrayFranquiciaJuegos.length);
  this.formFranquicia.reset
 }
  
 public EliminarFormJuego(indice:number):void{
  this.FormArrayFranquiciaJuegos.removeAt(indice)
 }

  }