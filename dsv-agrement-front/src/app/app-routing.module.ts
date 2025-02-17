import { NgModule } from '@angular/core';
import { Router, RouterModule, Routes } from '@angular/router';
import { AcceuilComponent } from './pages/acceuil/acceuil.component';
import { LoginComponent } from './pages/login/login.component';
import { AdminComponent } from './pages/admin/admin.component';
import { ModalsComponent } from './components/modals/modals.component';
import { DetailComponent } from './components/detail/detail.component';
import { CreateClientComponent } from './components/create-client/create-client.component';
import { CreateAdminComponent } from './components/create-admin/create-admin.component';
import { CreateVetoComponent } from './components/create-veto/create-veto.component';
import { CreateAgrementComponent } from './components/create-agrement/create-agrement.component';
import { CreateEstablishmentComponent } from './components/create-establishment/create-establishment.component';
import { EditComponent } from './pages/edit/edit.component';
import { ViewProfilComponent } from './pages/view-profil/view-profil.component';


const routes: Routes = [
  {path:"acceuil", component:AcceuilComponent},
  {path:"login", component:LoginComponent},
  {path:"register", component:CreateClientComponent},
  {path:"page/acc", component:AdminComponent},
  {path:"page/acc/profil", component: ViewProfilComponent},
  {path:"page/acc/profil/edit/:idUser", component: EditComponent},
  {path:"page/acc/:object", component:AdminComponent},
  {path:"page/acc/:object/detail", component:DetailComponent},
  {path:"page/signup", component:CreateAdminComponent},
  {path:"page/addVeto", component:CreateVetoComponent},
  {path:"page/addAgrement", component:CreateAgrementComponent},
  {path:"page/addEstablishment", component:CreateEstablishmentComponent},
  {path:"page/acc/agrement/:id", component: ModalsComponent},
  {path:"", redirectTo:"/acceuil", pathMatch:"full"}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,{ onSameUrlNavigation:'reload'})],
  exports: [RouterModule]
})
export class AppRoutingModule {
  constructor(private router: Router){
    this.router.onSameUrlNavigation='reload'
  }
}
