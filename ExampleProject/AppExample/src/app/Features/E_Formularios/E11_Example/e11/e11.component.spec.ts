import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E11Component } from './e11.component';

describe('E11Component', () => {
  let component: E11Component;
  let fixture: ComponentFixture<E11Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E11Component]
    });
    fixture = TestBed.createComponent(E11Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
