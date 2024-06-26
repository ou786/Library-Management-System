import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from '../dialog/dialog.component';

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.css']
})
export class ServicesComponent {
  showRentForm = false;
  showBuyForm = false;

  bookName: string = '';
  days: number = 0;

  constructor(public dialog: MatDialog) { }

  rentBook() {
    this.showRentForm = true;
    this.showBuyForm = false;
  }

  buyBook() {
    this.showBuyForm = true;
    this.showRentForm = false;
  }

  onRentNow() {
    console.log('Book rented:', this.bookName, 'for', this.days, 'days');
    // Add your rent logic here
    this.dialog.open(DialogComponent, {
      data: { message: 'Happy renting, Happy reading!' }
    });
    this.resetForm();
  }

  onBuyNow() {
    console.log('Book bought:', this.bookName);
    // Add your buy logic here
    this.dialog.open(DialogComponent, {
      data: { message: 'Happy buying, Happy reading!' }
    });
    this.resetForm();
  }

  resetForm() {
    this.bookName = '';
    this.days = 0;
    this.showRentForm = false;
    this.showBuyForm = false;
  }
}
