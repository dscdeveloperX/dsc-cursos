import { Routes } from "@angular/router";
import { UserListComponent } from "./Features/Users/Components/user-list/user-list.component";
import { UserFormComponent } from "./Features/Users/Components/user-form/user-form.component";
import { UserDetailComponent } from "./Features/Users/Components/user-detail/user-detail.component";

export const routes:Routes = [
    {
        path:'',
        pathMatch:'full',
        component:UserListComponent
    },
    {
        path:'user-list',
        component:UserListComponent
        //loadComponent:()=> import('./Features/Users/Components/user-list/user-list.component').then(x=>x.UserListComponent)
    },
    {
        path:'user-add',
        component:UserFormComponent
        //loadComponent:()=> import('./Features/Users/Components/user-form/user-form.component').then(x=>x.UserFormComponent)
    },
    {
        path:'user-edit/:id',
        component:UserFormComponent
        //loadComponent:()=> import('./Features/Users/Components/user-form/user-form.component').then(x=>x.UserFormComponent)
    },
    {
        path:'user-detail/:id',
        component:UserDetailComponent
        //loadComponent:()=> import('./Features/Users/Components/user-detail/user-detail.component').then(x=>x.UserDetailComponent)
    },
    {
        path: '**', // (siempre al final) Ruta de comodín para redirigir a la lista de usuarios si la ruta no existe
        redirectTo: 'user-list'
    }

];