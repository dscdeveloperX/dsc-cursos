import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { UserRestService } from 'src/app/Core/Services/user-rest.service';
import { IUserResponse } from 'src/app/Core/Models/IUserResponse';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-user-detail',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './user-detail.component.html',
  styleUrls: ['./user-detail.component.css']
})
export class UserDetailComponent implements OnInit {


  //entre parentencis debemos establecer un objeto por defecto
  //en este caso es un objeto vacio "({})" y por esa razon para evitar errores
  //debemos indicar que el valor del objeto es parcial asi: "signal<Partial<IUserResponse>>({})"
  public usuarioData = signal<Partial<IUserResponse>>({});
  

  //pasar estos parametros por el contructor es una forma abreviada de la injeccion de dependencias
  constructor(private router:Router, 
              private activatedRoute:ActivatedRoute,
              private userRestService:UserRestService){
    
  }

  
  ngOnInit(): void {
     //obtenemos de la url el valor del parametro "id"
     //el valor de id es de tipo indefinido asi que con "Number" casteamos (convertimos) su valor a un numero
     let userId = Number(this.activatedRoute.snapshot.paramMap.get('id'));
     //cargamos los detalles del usuario seleccionado
     this.GetUserById(userId);
  }


  private GetUserById(id:number):void{
    this.userRestService.GetUserById(id).subscribe(
      {
        next:(data:IUserResponse)=>{
            //obtenemos la respuesta del servicio y se la asignamos a la variable "usuarioData"
            this.usuarioData.set(data);
        },
        error:(er)=>{
            console.error(er);
        },
        complete:()=>{
            console.info('se completó con éxito');
        }
      }
    );
  }


//nos permite navegar a la lista de usuarios
public NavegarUserList():void{
this.router.navigate(['user-list']);
}



}
