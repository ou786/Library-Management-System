// member.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {environment} from '.././environment';

@Injectable({
  providedIn: 'root'
})
export class MemberService {
  //private apiUrl = 'http://localhost:5215/api'; 
  constructor(private http: HttpClient) {}

  getAllMembers(): Observable<any[]> {
    return this.http.get<any[]>(`${environment.apiUrl}/Member`); // Use environment.apiUrl
  }

  getMemberById(id: number): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/Member/${id}`);
  }

  addMember(memberData: any): Observable<any> {
    return this.http.post<any>(`${environment.apiUrl}/Member`, memberData);
  }

  updateMember(memberData: any): Observable<any> {
    return this.http.post<any>(`${environment.apiUrl}/Member/${memberData.member_id}`, memberData);
  }

  deleteMember(id: number): Observable<any> {
    return this.http.delete<any>(`${environment.apiUrl}/Member/${id}`);
  }
}
