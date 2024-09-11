import { ComponentFixture, TestBed } from '@angular/core/testing';

import { F10Component } from './f10.component';

describe('F10Component', () => {
  let component: F10Component;
  let fixture: ComponentFixture<F10Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [F10Component]
    });
    fixture = TestBed.createComponent(F10Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
