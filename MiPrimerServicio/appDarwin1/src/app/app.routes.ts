import { Routes } from "@angular/router";
import { AnimalListComponent } from "./Core/Modules/animal-list/animal-list.component";

export const routes:Routes = [
    {
        path:"",
        pathMatch:"full",
        component:AnimalListComponent
    }
];