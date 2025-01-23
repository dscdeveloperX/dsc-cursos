import { Routes } from "@angular/router";
import { AnimalListComponent } from "./Core/Modules/animal-list/animal-list.component";
import { ClubListComponent } from "./Core/Modules/Club/club-list/club-list.component";
import { ProductListComponent } from "./Core/Modules/Product/product-list/product-list.component";
import { ProductAddComponent } from "./Core/Modules/Product/product-add/product-add.component";
import { ProductEditComponent } from "./Core/Modules/Product/product-edit/product-edit.component";
import { ProductDeleteComponent } from "./Core/Modules/Product/product-delete/product-delete.component";

export const routes:Routes = [
    {
        path:"",
        pathMatch:"full",
        component:AnimalListComponent

        
    },
    {
        path:"club",
        component:ClubListComponent

    },

    {
        path:"productos",
        component:ProductListComponent
    },
    {
        path:"animal",
        component:AnimalListComponent
        
    },
    {
        path:"productos-add",
        component:ProductAddComponent
    },
    {
        path:"product-edit",
        component:ProductEditComponent
    },
    {
        path:"product-delete",
        component:ProductDeleteComponent
    }

   
];

