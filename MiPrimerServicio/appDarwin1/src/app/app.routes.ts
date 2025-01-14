import { Routes } from "@angular/router";
import { AnimalListComponent } from "./Core/Modules/animal-list/animal-list.component";
import { ClubListComponent } from "./Core/Modules/Club/club-list/club-list.component";
import { ProductListComponent } from "./Core/Modules/Product/product-list/product-list.component";

export const routes:Routes = [
    {
        path:"",
        pathMatch:"full",
        component:AnimalListComponent

        
    },
    {
        path:"club",
        pathMatch:"full",
        component:ClubListComponent

    },

    {
        path:"productos",
        pathMatch:"full",
        component:ProductListComponent
    }

   
];

