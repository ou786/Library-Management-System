import { Component,OnInit  } from '@angular/core';
import { Router } from '@angular/router';
import {  Renderer2, ElementRef } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  studentsData: any[] = [];
  constructor( private router: Router, private renderer: Renderer2, private el: ElementRef
    )
     {}
     
     navigateToRegistrationPage() {
      this.router.navigate(['/book']);
    }
    
    navigateToStudentList() {
      this.router.navigate(['/member']);
    }
    ngOnInit() {
      const description = this.el.nativeElement.querySelector('.library-description');
      const paragraph = this.el.nativeElement.querySelector('#sliding-paragraph');
  
      setTimeout(() => {
        this.renderer.setStyle(paragraph, 'margin', '10px 0');
        this.renderer.setStyle(description, 'height', paragraph.offsetHeight + 'px');
      }, 500);
  
}
}
