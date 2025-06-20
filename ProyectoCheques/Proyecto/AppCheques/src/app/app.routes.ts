import { Routes } from "@angular/router";
import { GenerateComponent } from "./Features/Cheque/generate/generate.component";
import { ReportComponent } from "./Features/Cheque/report/report.component";

export const routes:Routes = 
[
    {
        path: 'generate',
        component: GenerateComponent
    },

    {
        path: 'report',
        component: ReportComponent
    }

];