import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E10Component } from './e10.component';

describe('E10Component', () => {
  let component: E10Component;
  let fixture: ComponentFixture<E10Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E10Component]
    });
    fixture = TestBed.createComponent(E10Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
