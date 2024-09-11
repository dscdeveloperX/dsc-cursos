import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E14Component } from './e14.component';

describe('E14Component', () => {
  let component: E14Component;
  let fixture: ComponentFixture<E14Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E14Component]
    });
    fixture = TestBed.createComponent(E14Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
