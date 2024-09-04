import { ComponentFixture, TestBed } from '@angular/core/testing';

import { A11Component } from './a11.component';

describe('A11Component', () => {
  let component: A11Component;
  let fixture: ComponentFixture<A11Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [A11Component]
    });
    fixture = TestBed.createComponent(A11Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
