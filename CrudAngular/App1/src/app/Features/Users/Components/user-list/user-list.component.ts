import { ChangeDetectionStrategy, Component, inject, OnDestroy, OnInit, signal, WritableSignal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserRestService } from 'src/app/Core/Services/user-rest.service';
import { IUserResponse } from 'src/app/Core/Models/IUserResponse';
import { Router } from '@angular/router';


@Component({
  selector: 'app-user-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css'],
  changeDetection:ChangeDetectionStrategy.OnPush
})
export class UserListComponent implements OnInit {


  public userData:WritableSignal<IUserResponse[]> = signal<IUserResponse[]>([]);
  

  
  //injeccion de dependencias desde el constructor
  constructor(private userRestService:UserRestService,
              private router:Router){

  }
  

  ngOnInit(): void {
    this.GetUserAll();
  }


  private GetUserAll():void{
    this.userRestService.GetUserAll().subscribe(
      {
        next:(data:IUserResponse[])=>{
            this.userData.set(data);
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


  
  private DeleteUser(id:number):void{
    this.userRestService.DeleteUser(id).subscribe(
      {
        next:(data:any)=>{
            alert("Se eliminó usuario");
            this.GetUserAll();
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


  public NavegarUserEdit(id:number):void{
    this.router.navigate(['/user-edit',id]);
  }

  public NavegarUserDetail(id:number):void{
    this.router.navigate(['/user-detail',id]);
  }

  public NavegarUserAdd():void{
    this.router.navigate(['/user-add']);
  }

  public NavegarUserList():void{
    this.router.navigate(['/user-list']);
  }


public EliminarUsuario(id:number):void{
  const confirmaEliminacion:boolean = confirm('Confirmar eliminación de usuario');
  if(confirmaEliminacion == true){
    //eliminamos usuario
    this.DeleteUser(id);
  }
}




}
