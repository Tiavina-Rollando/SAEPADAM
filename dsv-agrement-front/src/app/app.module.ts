import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { AcceuilComponent } from './pages/acceuil/acceuil.component';
import { RouterModule } from '@angular/router';
import { HttpClientModule, provideHttpClient, withFetch } from '@angular/common/http';
import { CommonModule, DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LogoDirective } from './directives/logo.directive';
import { ButtonDirective } from './directives/button.directive';
import { EditComponent } from './pages/edit/edit.component';
import { QRCodeModule } from 'angularx-qrcode';
import { NgxScannerQrcodeModule } from 'ngx-scanner-qrcode';
import { LoginComponent } from './pages/login/login.component';
import { ModalsComponent } from './components/modals/modals.component';
import { CreateEstablishmentComponent } from './components/create-establishment/create-establishment.component';
import { CreateAdminComponent } from './components/create-admin/create-admin.component';
import { CreateClientComponent } from './components/create-client/create-client.component';
import { CreateVetoComponent } from './components/create-veto/create-veto.component';
import { CreateAgrementComponent } from './components/create-agrement/create-agrement.component';
import { ViewProfilComponent } from './pages/view-profil/view-profil.component';
import { NgxSpinnerModule } from 'ngx-spinner';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ColorDirective } from './directives/color.directive';
@NgModule({
  declarations: [
    AppComponent,
    ButtonDirective,
    HeaderComponent,
    FooterComponent,
    AcceuilComponent,
    EditComponent,
    LoginComponent,
    ModalsComponent,
    CreateEstablishmentComponent,
    CreateAdminComponent,
    CreateClientComponent,
    CreateVetoComponent,
    CreateAgrementComponent,
    ViewProfilComponent,
  ],
  imports: [
    BrowserModule,
    NgxSpinnerModule,
    QRCodeModule,
    NgxScannerQrcodeModule,
    AppRoutingModule,
    RouterModule,
    HttpClientModule,
    ColorDirective,
    LogoDirective,
    CommonModule,
    FormsModule,
    BrowserAnimationsModule,
    DatePipe,
  ],
  exports: [
    ButtonDirective,
    HeaderComponent,
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  providers: [
    provideHttpClient(withFetch())
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
