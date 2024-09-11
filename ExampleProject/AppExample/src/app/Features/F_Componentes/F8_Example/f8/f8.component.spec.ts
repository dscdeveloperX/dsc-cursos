import { ComponentFixture, TestBed } from '@angular/core/testing';

import { F8Component } from './f8.component';

describe('F8Component', () => {
  let component: F8Component;
  let fixture: ComponentFixture<F8Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [F8Component]
    });
    fixture = TestBed.createComponent(F8Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
