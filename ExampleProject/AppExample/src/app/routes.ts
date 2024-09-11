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
import { E1Component } from "./Features/E_Formularios/E1_Example/e1/e1.component";
import { E2Component } from "./Features/E_Formularios/E2_Example/e2/e2.component";
import { E3Component } from "./Features/E_Formularios/E3_Example/e3/e3.component";
import { E4Component } from "./Features/E_Formularios/E4_Example/e4/e4.component";
import { E5Component } from "./Features/E_Formularios/E5_Example/e5/e5.component";
import { E6Component } from "./Features/E_Formularios/E6_Example/e6/e6.component";
import { E7Component } from "./Features/E_Formularios/E7_Example/e7/e7.component";
import { E8Component } from "./Features/E_Formularios/E8_Example/e8/e8.component";
import { E9Component } from "./Features/E_Formularios/E9_Example/e9/e9.component";
import { E10Component } from "./Features/E_Formularios/E10_Example/e10/e10.component";
import { E11Component } from "./Features/E_Formularios/E11_Example/e11/e11.component";
import { A11Component } from "./Features/A_TypeScript/A11_Example/a11/a11.component";
import { A10Component } from "./Features/A_TypeScript/A10_Example/a10/a10.component";
import { A9Component } from "./Features/A_TypeScript/A9_Example/a9/a9.component";
import { A8Component } from "./Features/A_TypeScript/A8_Example/a8/a8.component";
import { A7Component } from "./Features/A_TypeScript/A7_Example/a7/a7.component";
import { A6Component } from "./Features/A_TypeScript/A6_Example/a6/a6.component";
import { A5Component } from "./Features/A_TypeScript/A5_Example/a5/a5.component";
import { E0Component } from "./Features/E_Formularios/E0_Example/e0/e0.component";
import { E12Component } from "./Features/E_Formularios/E12_Example/e12/e12.component";

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
        path:'a6',
        component:A6Component
    },
    {
        path:'a7',
        component:A7Component
    },
    {
        path:'a8',
        component:A8Component
    },
    {
        path:'a9',
        component:A9Component
    },
    {
        path:'a10',
        component:A10Component
    },
    {
        path:'a11',
        component:A11Component
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
    },
    {
        path:'e0',
        component:E0Component
    },
    {
        path:'e1',
        component:E1Component
    },
    {
        path:'e2',
        component:E2Component
    },
    {
        path:'e3',
        component:E3Component
    },
    {
        path:'e4',
        component:E4Component
    },
    {
        path:'e5',
        component:E5Component
    },
    {
        path:'e6',
        component:E6Component
    },
    {
        path:'e7',
        component:E7Component
    },
    {
        path:'e8',
        component:E8Component
    },
    {
        path:'e9',
        component:E9Component
    },
    {
        path:'e10',
        component:E10Component
    },
    {
        path:'e11',
        component:E11Component
    },
    {
        path:'e12',
        component:E12Component
    }

];