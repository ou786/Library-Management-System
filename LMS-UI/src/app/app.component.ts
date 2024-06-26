import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Import the Router module

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(private router: Router) { } // Inject the Router in the constructor

  viewMembers() {
    // Implement the navigation logic to the Members component
    this.router.navigate(['./member/member.component']); // Replace '/members' with the actual path to your Members component
  }
  }
