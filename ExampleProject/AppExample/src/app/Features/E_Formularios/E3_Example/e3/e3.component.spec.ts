import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E3Component } from './e3.component';

describe('E3Component', () => {
  let component: E3Component;
  let fixture: ComponentFixture<E3Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E3Component]
    });
    fixture = TestBed.createComponent(E3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
