import { ComponentFixture, TestBed } from '@angular/core/testing';

import { A7Component } from './a7.component';

describe('A7Component', () => {
  let component: A7Component;
  let fixture: ComponentFixture<A7Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [A7Component]
    });
    fixture = TestBed.createComponent(A7Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
