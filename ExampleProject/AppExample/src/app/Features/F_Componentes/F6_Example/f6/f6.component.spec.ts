import { ComponentFixture, TestBed } from '@angular/core/testing';

import { F6Component } from './f6.component';

describe('F6Component', () => {
  let component: F6Component;
  let fixture: ComponentFixture<F6Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [F6Component]
    });
    fixture = TestBed.createComponent(F6Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
