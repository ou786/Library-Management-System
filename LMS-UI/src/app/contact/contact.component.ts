import { Component } from '@angular/core';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent {
  contactInfo = {
    email: 'hogwarts.library@hogwarts.edu',
    phone: '+1-234-567-890'
  };
}
