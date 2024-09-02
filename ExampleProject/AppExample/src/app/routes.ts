import { Routes } from "@angular/router";
import { InicioComponent } from "./Shared/Components/inicio/inicio.component";
import { D1Component } from "./Features/D_DirectivaFor/D1_example/d1/d1.component";
import { D2Component } from "./Features/D_DirectivaFor/D2_example/d2/d2.component";
import { D3Component } from "./Features/D_DirectivaFor/D3_example/d3/d3.component";
import { D4Component } from "./Features/D_DirectivaFor/D4_example/d4/d4.component";
import { D5Component } from "./Features/D_DirectivaFor/D5_example/d5/d5.component";
import { B1Component } from "./Features/B_DirectivaIf/B1_example/b1/b1.component";
import { B2Component } from "./Features/B_DirectivaIf/B2_example/b2/b2.component";
import { B3Component } from "./Features/B_DirectivaIf/B3_example/b3/b3.component";
import { C2Component } from "./Features/C_Eventos/C2_example/c2/c2.component";
import { C3Component } from "./Features/C_Eventos/C3_example/c3/c3.component";
import { C4Component } from "./Features/C_Eventos/C4_example/c4/c4.component";
import { C5Component } from "./Features/C_Eventos/C5_example/c5/c5.component";
import { C1Component } from "./Features/C_Eventos/C1_example/c1/c1.component";
import { C6Component } from "./Features/C_Eventos/C6_example/c6/c6.component";
import { A1Component } from "./Features/A_TypeScript/A1_Example/a1/a1.component";
import { A2Component } from "./Features/A_TypeScript/A2_Example/a2/a2.component";
import { A3Component } from "./Features/A_TypeScript/A3_Example/a3/a3.component";
import { A4Component } from "./Features/A_TypeScript/A4_Example/a4/a4.component";

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
    },
    {
        path:'c6',
        component:C6Component
    }, {
        path:'d1',
        component:D1Component
    },
    {
        path:'d2',
        component:D2Component
    },
    {
        path:'d3',
        component:D3Component
    },
    {
        path:'d4',
        component:D4Component
    },
    {
        path:'d5',
        component:D5Component
    }

];