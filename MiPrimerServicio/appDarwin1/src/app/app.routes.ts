import { Routes } from "@angular/router";
import { AnimalListComponent } from "./Core/Modules/animal-list/animal-list.component";
import { ClubListComponent } from "./Core/Modules/Club/club-list/club-list.component";

export const routes:Routes = [
    {
        path:"",
        pathMatch:"full",
        component:AnimalListComponent

        
    },

    {
        path:"club",
        component:ClubListComponent
    }
];