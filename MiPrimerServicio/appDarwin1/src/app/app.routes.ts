import { Routes } from "@angular/router";
import { AnimalListComponent } from "./Core/Modules/animal-list/animal-list.component";
import { ClubListComponent } from "./Core/Modules/Club/club-list/club-list.component";
import { ProductListComponent } from "./Core/Modules/Product/product-list/product-list.component";
import { ProductAddComponent } from "./Core/Modules/Product/product-add/product-add.component";

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
    }

   
];

