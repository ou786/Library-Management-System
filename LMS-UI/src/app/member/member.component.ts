// member.component.ts
import { Component, OnInit } from '@angular/core';
import { MemberService } from '../member.service'; // Import the service


@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.css']
})
export class MemberComponent implements OnInit {
  members: any[];
  selectedMember: any;
  newMember: any;

  constructor(private memberService: MemberService) {
    this.members = [];
    this.newMember = {};
  }

  ngOnInit() {
    this.loadMembers();
  }

  loadMembers() {
    this.memberService.getAllMembers().subscribe((data) => {
      this.members = data;
    });
  }

  getMemberById(id: number) {
    this.memberService.getMemberById(id).subscribe((data) => {
      this.selectedMember = data;
    });
  }

  addMember() {
    this.memberService.addMember(this.newMember).subscribe(() => {
      this.loadMembers();
      this.newMember = {};
    });
  }

  updateMember() {
    this.memberService.updateMember(this.selectedMember).subscribe(() => {
      this.loadMembers();
      this.selectedMember = null;
    });
  }

  deleteMember(id: number) {
    this.memberService.deleteMember(id).subscribe((result) => {
      if(result){
        this.loadMembers();
        this.selectedMember = null;
      } else{
        
      }
    });
  }
}
