import { Routes } from "@angular/router";
import { InicioComponent } from "./Shared/Components/inicio/inicio.component";
import { A1Component } from "./Features/A_DirectivaFor/A1_example/a1/a1.component";
import { A2Component } from "./Features/A_DirectivaFor/A2_example/a2/a2.component";
import { A3Component } from "./Features/A_DirectivaFor/A3_example/a3/a3.component";
import { A4Component } from "./Features/A_DirectivaFor/A4_example/a4/a4.component";
import { A5Component } from "./Features/A_DirectivaFor/A5_example/a5/a5.component";
import { B1Component } from "./Features/B_DirectivaIf/B1_example/b1/b1.component";
import { B2Component } from "./Features/B_DirectivaIf/B2_example/b2/b2.component";
import { B3Component } from "./Features/B_DirectivaIf/B3_example/b3/b3.component";
import { C1Component } from "./Features/C_EventoClick/C1_example/c1/c1.component";
import { C2Component } from "./Features/C_EventoClick/C1_example/c2/c2.component";
import { C3Component } from "./Features/C_EventoClick/C1_example/c3/c3.component";
import { C4Component } from "./Features/C_EventoClick/C1_example/c4/c4.component";
import { C5Component } from "./Features/C_EventoClick/C1_example/c5/c5.component";

export const routes:Routes=[
    {
        path:'',
        component:InicioComponent,
        pathMatch:'full'
    },
    {
        path:'a1',
        component:A1Component
    },
    {
        path:'a2',
        component:A2Component
    },
    {
        path:'a3',
        component:A3Component
    },
    {
        path:'a4',
        component:A4Component
    },
    {
        path:'a5',
        component:A5Component
    },
    {
        path:'b1',
        component:B1Component
    },
    {
        path:'b2',
        component:B2Component
    },
    {
        path:'b3',
        component:B3Component
    },
    {
        path:'c1',
        component:C1Component
    },
    {
        path:'c2',
        component:C2Component
    },
    {
        path:'c3',
        component:C3Component
    },
    {
        path:'c4',
        component:C4Component
    },
    {
        path:'c5',
        component:C5Component
    }

];