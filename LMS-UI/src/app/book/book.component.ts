// book.component.ts
import { Component, OnInit } from '@angular/core';
import { BookService } from '../book.service';
import { BooksModel } from '../books-model';

@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: ['./book.component.css']
})
export class BookComponent implements OnInit {
  books: BooksModel[] = [];
  selectedBook: any;
  private _newBook: BooksModel = {
    book_id: 0,
    title: '',
    author_name:'',
    edition: 0,
    published_year: ''
  }; // Initialize with an empty object
  public get newBook(): BooksModel {
    return this._newBook;
  }
  public set newBook(value: BooksModel) {
    this._newBook = value;
  }

  constructor(private bookService: BookService) {}

  ngOnInit() {
    this.loadBooks();
  }

  loadBooks() {
    this.bookService.getAllBooks().subscribe((data) => {
      this.books = data;
    });
  }

  addBook() {
    this.bookService.addBook(this.newBook).subscribe(() => {
      this.loadBooks();
    });
  }

  getBookById(id: number) {
    this.bookService.getBookById(id).subscribe((data) => {
      this.selectedBook = data;
    });
  }

  updateBook() {
    this.bookService.updateBook(this.selectedBook).subscribe((result) => {
      if (result) {
        this.loadBooks(); // Reload the list after updating
      } else {
        // Handle error
      }
    });
  }

  deleteBook(id: number) {
    debugger;
    this.bookService.deleteBook(id).subscribe((result) => {
      if (result) {
        this.loadBooks(); // Reload the list after updating
      } else {
        // Handle error
      }
    });
  }
}
