import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E15Component } from './e15.component';

describe('E15Component', () => {
  let component: E15Component;
  let fixture: ComponentFixture<E15Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E15Component]
    });
    fixture = TestBed.createComponent(E15Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
