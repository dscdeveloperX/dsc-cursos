import { booleanAttribute, Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IPersona } from 'src/app/Core/Models/ipersona';


@Component({
  selector: 'app-a4',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './a4.component.html',
  styleUrls: ['./a4.component.css']
})
export class A4Component {

  public personasData = signal<IPersona[]>([]);


  public constructor(){

    //llenamos la lista personas
    this.LlenarPersonasData();
    
  }


public LlenarPersonasData():void{
  //cargamos datos iniciales
  this.personasData.set(
    [
    {
      cedula: '0000000001',
      nombre: 'Angel Alava',
      sueldo: 1000.10,
      fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
      edad: 10,
      discapacitado: false
    },
    {
      cedula: '0000000002',
      nombre: 'Byron Bravo',
      sueldo: 2000.20,
      fechaNacimiento: new Date('1977-07-12T00:00:00Z'),
      edad: 20,
      discapacitado: true
    },
    {
      cedula: '0000000003',
      nombre: 'Caled Castro',
      sueldo: 3000.30,
      fechaNacimiento: new Date('1999-12-28T00:00:00Z'),
      edad: 30,
      discapacitado: false
    }
  ]
);

}



  public AgregarPersona():void{

    const persona:IPersona =  {
      cedula: '0918723453',
      nombre: 'El papito',
      sueldo: 2500.10,
      fechaNacimiento: new Date('1977-07-21T00:00:00Z'),
      edad: 37,
      discapacitado: false
    };

    //establecemos un nuevo valor
    this.personasData.set(
      
      [
        ...this.personasData(), //"..." es un operador de propagación y su funcion aquí es copiar en un nuevo array. 
        persona //Luego, añadimos la nueva persona al final de este nuevo array
      ]

    );

  }


  public BuscarPersonaPorCedula(evento:MouseEvent, cedula:string):void{
      
    //variable donde se guardara un objeto persona o en su defecto no tendra un objeto definido
      let primerRegistroEncontrado:IPersona | undefined;
      
      //find: busca en "personasData" EL PRIMER registro que coincida con la busqueda
      primerRegistroEncontrado = this.personasData().find(
        (item) => item.cedula == cedula
      );

      //si la busqueda dio como resultado al menos un registro entonces "primerRegistroEncontrado" es indistinto a nulo
      if(primerRegistroEncontrado != null){
        //como "personasData" necesita un array de objetos personas, etonces envolvemos el objeto en corchetes para volverlo un array de objetos personas "[ primerRegistroEncontrado ]"
        this.personasData.set(
          [ primerRegistroEncontrado ]
        );
      }
      
      
  }



  public BuscarPersonaPorEdad(evento:MouseEvent, edad:number):void{
      
      //variable donde se guardara resultado
      let registrosEncontrados:IPersona[];
      
      //filter: filtra "personasData" y obtiene todos registro que coincida con la busqueda
      registrosEncontrados = this.personasData().filter(
        (item) => item.edad >= edad
      );

      //guarda los registros encontrados en "personaData"
      this.personasData.set(
        registrosEncontrados
      );
      
      
  }

  public BuscarPersonaPorDiscapacitada(evento:MouseEvent, discapacitado:boolean):void{
      //variable donde se guardara resultado
      let registrosEncontrados:IPersona[];
      
      //filter: filtra "personasData" y obtiene todos registro que coincida con la busqueda
      registrosEncontrados = this.personasData().filter(
        (item) => item.discapacitado >= discapacitado
      );

      //guarda los registros encontrados en "personaData"
      this.personasData.set(
        registrosEncontrados
      );      
  }

  public BuscarPersonaPorNombre(evento:MouseEvent, nombreContiene:string):void{
 //variable donde se guardara resultado
    let registrosEncontrados:IPersona[];
          
    //filter: filtra "personasData" y obtiene todos registro que coincida con la busqueda
    //includes: textos que incluyen estos caractres 'av'
    registrosEncontrados = this.personasData().filter(
      (item) => item.nombre.includes(nombreContiene)
    );

    //guarda los registros encontrados en "personaData"
    this.personasData.set(
      registrosEncontrados
    );      
  }


  public EliminarPersonaPorCedula(evento:MouseEvent, cedula:string):void{
    
    //sacampos una copia de "personaData"
    const personasDataCopia:IPersona[]= this.personasData();
    //variable donde se guardara resultado
    let registrosEncontrados:IPersona[];
    
    //filter: filtra "personasDataCopia" y obtiene todos registro excepto aquel cuya cedula es igual a "0000000002"
    registrosEncontrados = personasDataCopia.filter(
      (item) => item.cedula != cedula
    );

    //guarda los registros encontrados en "personaData"
    this.personasData.set(
      registrosEncontrados
    );
    
    
}


public EditarPersonaPorCedula(evento:MouseEvent, cedula:string):void{
      
  //sacampos una copia de "personaData"
  const personasDataCopia:IPersona[]= this.personasData();

  //findIndex: obtenemos el indice de "personasData" donde la cedula es igual a "0000000002"
  const indice = this.personasData().findIndex(
    (item) => item.cedula == cedula
  );

  //actualizamos los datos del registro del indice obtenido
  personasDataCopia[indice].nombre = "SCARLET SANCHEZ";
  personasDataCopia[indice].sueldo = 15425.22;
  personasDataCopia[indice].fechaNacimiento = new Date(2005,8,12);
  personasDataCopia[indice].discapacitado = false;
  personasDataCopia[indice].edad = 19;

  //guardamos la copia de "personaData"
  this.personasData.set(
    personasDataCopia
  );
  
  
}





}
