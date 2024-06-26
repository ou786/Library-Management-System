// app-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ServicesComponent } from './services/services.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { MemberComponent } from './member/member.component';
import { BookComponent } from './book/book.component'; 
import { DialogComponent } from './dialog/dialog.component';

const routes: Routes = [
  { path: '', redirectTo: 'app/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'services', component: ServicesComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component:ContactComponent },
  { path: 'members', component: MemberComponent },
  { path: 'book', component: BookComponent },
  { path: 'dialog',component:DialogComponent},
  { path: '**', redirectTo: '/home' }
  // ...
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
