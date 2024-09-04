import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E7Component } from './e7.component';

describe('E7Component', () => {
  let component: E7Component;
  let fixture: ComponentFixture<E7Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E7Component]
    });
    fixture = TestBed.createComponent(E7Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
