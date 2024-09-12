import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F6HijoAComponent } from '../f6-hijo-a/f6-hijo-a.component';
import { F6HijoBComponent } from '../f6-hijo-b/f6-hijo-b.component';
import { F6HijoCComponent } from '../f6-hijo-c/f6-hijo-c.component';

@Component({
  selector: 'app-f6',
  standalone: true,
  imports: [CommonModule, F6HijoAComponent, F6HijoBComponent, F6HijoCComponent],
  templateUrl: './f6.component.html',
  styleUrls: ['./f6.component.css']
})
export class F6Component {

}
