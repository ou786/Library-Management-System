// book.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { BooksModel } from '../app/books-model';
import {environment} from '.././environment';

@Injectable({
  providedIn: 'root'
})
export class BookService {
  //private apiUrl = 'http://localhost:5215/api';

  constructor(private http: HttpClient) {}

  addBook(bookData: any): Observable<any> {
    return this.http.post<any>(`${environment.apiUrl}/Book`, bookData);
  }

  updateBook(bookData: any): Observable<any> {
    return this.http.post<any>(`${environment.apiUrl}/Book/${bookData.book_id}`, bookData);
  }

  getBookById(id: number): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/Book/${id}`);
  }

  deleteBook(id: number): Observable<any> {
    return this.http.delete<any>(`${environment.apiUrl}/Book/${id}`);
  }

  getAllBooks(): Observable<any[]> {
    return this.http.get<any[]>(`${environment.apiUrl}/Book`);
  }
}
