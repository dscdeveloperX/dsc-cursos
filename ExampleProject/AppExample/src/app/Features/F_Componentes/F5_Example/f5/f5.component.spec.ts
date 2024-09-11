import { ComponentFixture, TestBed } from '@angular/core/testing';

import { F5Component } from './f5.component';

describe('F5Component', () => {
  let component: F5Component;
  let fixture: ComponentFixture<F5Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [F5Component]
    });
    fixture = TestBed.createComponent(F5Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
