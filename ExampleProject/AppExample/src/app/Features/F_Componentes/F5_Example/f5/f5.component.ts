import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { F5HijoAComponent } from '../f5-hijo-a/f5-hijo-a.component';
import { F5HijoBComponent } from '../f5-hijo-b/f5-hijo-b.component';
import { F5HijoCComponent } from '../f5-hijo-c/f5-hijo-c.component';

@Component({
  selector: 'app-f5',
  standalone: true,
  imports: [CommonModule, F5HijoAComponent, F5HijoBComponent, F5HijoCComponent],
  templateUrl: './f5.component.html',
  styleUrls: ['./f5.component.css']
})
export class F5Component {

}
