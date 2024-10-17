import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { UserRestService } from 'src/app/Core/Services/user-rest.service';
import { IUserResponse } from 'src/app/Core/Models/IUserResponse';
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-user-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css']
})
export class UserFormComponent implements OnInit {


  public userId:number|undefined = 0;
  
  //definimos variables del formulario
  public userGroup!:FormGroup; 
  public ctrlName!:FormControl;
  public ctrlEmail!:FormControl;
  public ctrlGender!:FormControl;
  public ctrlStatus!:FormControl;
  public modoActualizar:boolean =false;//indica si se realiza una insercion o una actualizacion
  
  

  //pasamos como parametros en el constructor de la clase lo que se conoce como injeccion de dependencias
  constructor(private activatedRoute:ActivatedRoute, 
              private userRestService:UserRestService,
              private router:Router)
  {
  }

  


  ngOnInit(): void {

    this.ctrlName = new FormControl('',Validators.compose([Validators.required]));
    this.ctrlEmail = new FormControl('',Validators.compose([Validators.required, Validators.email]));
    this.ctrlGender = new FormControl('',Validators.compose([Validators.required]));
    this.ctrlStatus   = new FormControl('',Validators.compose([Validators.required]));

    this.userGroup = new FormGroup({
      name:this.ctrlName,
      email:this.ctrlEmail,
      gender:this.ctrlGender,
      status:this.ctrlStatus
    });

    //obtenemos parametro "id" de la url
    this.userId = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    
    //si el valor del parametro "id" es indistinto a "0" entonces consideramos que vamos a hacer una actualizacion
    if(this.userId != 0){
      //indicamos que realizaremos una actualizacion
      this.modoActualizar = true;
      //cargamos informacion del usuario que vamos a actualizar
      this.GetUserById(this.userId);
    }
    

  }



  //obtenemos los datos del usuario
  private GetUserById(id:number):void{
    this.userRestService.GetUserById(id).subscribe(
      {
        next:(data:IUserResponse)=>{
            this.userGroup.patchValue(data);
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


  //actualizamos el usuario
  private PutUser():void{
    this.userRestService.PutUser(this.userId!, this.userGroup.value).subscribe(
      {
        next:(data:IUserResponse[])=>{
            alert('Se Actualizó nuevo usuario');
            this.NavegarUserList();
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


  //agregamos un usuario
  private PostUser():void{
    this.userRestService.PostUser(this.userGroup.value).subscribe(
      {
        next:(data:IUserResponse[])=>{
            alert('Se agregó nuevo usuario');
            this.NavegarUserList();
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



  //boton que segun el caso actualiza o agrega usuario
  public GuardarUser():void{

    if(this.userGroup.valid){//pregunta si formulario tiene datos validos

      if(this.modoActualizar == true){
        //actualizo
        this.PutUser();
      }else{
        //agrego
        this.PostUser();
      }


    }

  }



public NavegarUserList():void{
this.router.navigate(['user-list']);
}



}
