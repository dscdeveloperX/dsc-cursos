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
      //creamos un array
      franquiciaJuegos: new FormArray([],Validators.required)
    });
  }
  //devuelve una copia de un formulario que servira de plantilla
  public get NuevoFormJuegos(){
    //nuevo formgrupo incializado 
    return new FormGroup({
      juegoNombre: new FormControl('',Validators.compose([Validators.required])),
      juegosPuntuacion: new FormControl(0,Validators.compose([Validators.required,Validators.min(0)]))
    })
  }
  //devuelve el array 
  public get FormArrayFranquiciaJuegos(): FormArray{
    //obtenemos de formFranquicia el array franquiciaJuegos
    return this.formFranquicia.get('franquiciaJuegos') as FormArray;
  }
  //agregamos el array al nuevo formulario
  public AgregarFormJuego():void{
    //ya que formArrayFranquiciaJuegos tiene el formArray esta vez usamos push para enviarlo a NuevoFormJuegos
    this.FormArrayFranquiciaJuegos.push(this.NuevoFormJuegos);
  }
  

  //controles del filtro del form Franquicia
  public gamesFiltroData = signal<IgamesTipo[]>([])
  public gamesFiltroData2 = signal<Igames[]>([])
  //campos de cada tipo de interfaz que se va a usar
  public gamesData!: Igames[];
  public tipoGamesData!: IgamesTipo[];
  public franquiciaData!: IgamesFranquicia[];

  ngOnInit(): void {
    //Si hay cambios en el valor de franquicia data 
    //la variable valor tal que una constante de tipo interfaz IgamesTipo[] es igual a un filtro del campo tipoGamesData
    //en el cual item tal que un item perteneciente a gamesFranquiciaId lo cual debe ser estrictamente igual a valor
    
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
  
  
  
  //igamesTipo interfazse llena 
   private CargarTipoJuego(){
    //gracias al campo
    this.tipoGamesData=[
      { gamesFranquiciaId: 'MM',
        gamesTipoId: 'MMC',
        nombre: 'Megaman Classic',
      },
      { gamesFranquiciaId: 'MM',
        gamesTipoId: 'MMX',
        nombre:'Megaman X',

      },
      {
        gamesFranquiciaId: 'MM',
        gamesTipoId: 'MMZ',
        nombre: 'Megaman Zero',
      },
      {
        gamesFranquiciaId: 'MM',
        gamesTipoId: 'MMZX',
        nombre: 'Megaman ZX',
      },
      {
        gamesFranquiciaId: 'MM',
        gamesTipoId: 'MML',
        nombre: 'Megaman Legends',
      },
      //Pokemon Generaciones
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN1',
        nombre: 'Primera Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN2',
        nombre: 'Segunnda Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN3',
        nombre: 'Tercera Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN4',
        nombre: 'Cuarta Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN5',
        nombre: 'Quinta Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN6',
        nombre: 'Sexta Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN7',
        nombre: 'Septima Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN8',
        nombre: 'Octava Generacion',
      },
      {
        gamesFranquiciaId: 'PKM',
        gamesTipoId: 'GEN9',
        nombre: 'Novena Generacion'
      }

     
    ];
   }
   //igamesFranquicia interface
   private CargarFranquicia(){
    //se llena gracias al campo franquiciaData
    this.franquiciaData=[
      {
        gamesFranquiciaId: 'MM',
        nombre: 'Megaman',
      },
      {
        gamesFranquiciaId: 'PKM',
        nombre: 'Pokemon'
      }
    ]
   }
   //el contructor
   constructor(){
    //inicializamos la creacion  del form y cuando se llena los metodos de interfaz
    this.CrearFormFranquicia();
    this.CargarFranquicia();
    this.CargarTipoJuego();
    this.CargarJuegos();
   }
   //igames interface
  private CargarJuegos(){
    //se llena gracias a gamesData
    this.gamesData=[
      //Megaman Clasico
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
      {
        gamesId: 'MM7',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 7',
      },
      {
        gamesId: 'MM8',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 8',
      },
      {
        gamesId: 'MM&B',
        gamesTipoId: 'MMC',
        nombre: 'Megaman & Bass',
      },
      {
        gamesId: 'MM9',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 9',
      },
      {
        gamesId: 'MM10',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 10',
      },
      {
        gamesId: 'MM11',
        gamesTipoId: 'MMC',
        nombre: 'Megaman 11',
      },
        
      
        //Megaman X
      
      {
        gamesId: 'MMX1',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X1',
      },
      {
        gamesId: 'MMX2',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X2',
      },
      {
        gamesId: 'MMX3',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X3',
      },
      {
        gamesId: 'MMX4',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X4',
      },
      {
        gamesId: 'MMX5',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X5',
      },
      {
        gamesId: 'MMX6',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X6',
      },
      {
        gamesId: 'MMX7',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X7',
      },
      {
        gamesId: 'MMX8',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X8',
      },
      {
        gamesId: 'MMXCM',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X Command Mission',
      },
      {
        gamesId: 'MMXD',
        gamesTipoId: 'MMX',
        nombre: 'Megaman X Dive',
      },

      //Megaman zero
      {
        gamesId: 'MMZ1',
        gamesTipoId: 'MMZ',
        nombre: 'Megaman Zero 1',
      },
      {
        gamesId: 'MMZ2',
        gamesTipoId: 'MMZ',
        nombre: 'Megaman Zero 2',
      },
      {
        gamesId: 'MMZ3',
        gamesTipoId: 'MMZ',
        nombre: 'Megaman Zero 3',
      },
      {
        gamesId: 'MMZ4',
        gamesTipoId: 'MMZ',
        nombre: 'Megaman Zero 4',
      },

      //Megaman ZX
      {
        gamesId: 'MMZX1',
        gamesTipoId: 'MMZX',
        nombre: 'Megaman ZX',
      },
      {
        gamesId: 'MMZXA',
        gamesTipoId: 'MMZX',
        nombre: 'Megaman ZX Advent',
      },
      //Megaman Legends
      {
        gamesId: 'MML1',
        gamesTipoId: 'MML',
        nombre: 'Megaman Legends',
      },
      {
        gamesId: 'MML2',
        gamesTipoId: 'MML',
        nombre: 'Megaman Legends 2',
      },
      {
        gamesId: 'MMTB',
        gamesTipoId: 'MML',
        nombre: 'The Misadventures of Tron Bonne'
      },
      //Generacion 1
      {
        gamesId:'RED',
        gamesTipoId: 'GEN1',
        nombre:'Pokemon Rojo',
      },
      {
        gamesId:'BLUE',
        gamesTipoId: 'GEN1',
        nombre:'Pokemon Blue',
      },
      {
        gamesId:'GREEN',
        gamesTipoId: 'GEN1',
        nombre:'Pokemon Green',
      },
      {
        gamesId:'YELLOW',
        gamesTipoId: 'GEN1',
        nombre:'Pokemon Yellow',
      },
      {
        gamesId:'GOLD',
        gamesTipoId: 'GEN2',
        nombre:'Pokemon Gold',
      },
      {
        gamesId:'SILVER',
        gamesTipoId: 'GEN2',
        nombre:'Pokemon Silver',
      },
      {
        gamesId:'CRYSTAL',
        gamesTipoId: 'GEN2',
        nombre:'Pokemon Crystal',
      },
      {
        gamesId:'FIRERED',
        gamesTipoId: 'GEN3',
        nombre:'Pokemon Fire Red',
      },
      {
        gamesId:'LEAFGREEN',
        gamesTipoId: 'GEN3',
        nombre:'Pokemon Leaf Green',
      },
      {
        gamesId:'RUBY',
        gamesTipoId: 'GEN3',
        nombre:'Pokemon Ruby',
      },
      {
        gamesId:'SAPPHIRE',
        gamesTipoId: 'GEN3',
        nombre:'Pokemon Sapphire',
      },
      {
        gamesId:'EMERALD',
        gamesTipoId: 'GEN3',
        nombre:'Pokemon Emerald',
      },
      {
        gamesId:'HEARTGOLD',
        gamesTipoId: 'GEN4',
        nombre:'Pokemon Heart Gold',
      },
      {
        gamesId:'SOULSILVER',
        gamesTipoId: 'GEN4',
        nombre:'Pokemon Soul Silver',
      },
      {
        gamesId:'DIAMOND',
        gamesTipoId: 'GEN4',
        nombre:'Pokemon Diamond',
      },
      {
        gamesId:'PEARL',
        gamesTipoId: 'GEN4',
        nombre:'Pokemon Pearl',
      },
      {
        gamesId:'PLATINUM',
        gamesTipoId: 'GEN4',
        nombre:'Pokemon Platinum',
      },
      {
        gamesId:'BLACK',
        gamesTipoId: 'GEN5',
        nombre:'Pokemon Black',
      },
      {
        gamesId:'WHITE',
        gamesTipoId: 'GEN5',
        nombre:'Pokemon White',
      },
      {
        gamesId:'BLACK2',
        gamesTipoId: 'GEN5',
        nombre:'Pokemon Black 2',
      },
      {
        gamesId:'WHITE2',
        gamesTipoId: 'GEN5',
        nombre:'Pokemon White 2',
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