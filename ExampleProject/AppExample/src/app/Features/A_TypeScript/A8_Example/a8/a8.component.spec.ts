import { ComponentFixture, TestBed } from '@angular/core/testing';

import { A8Component } from './a8.component';

describe('A8Component', () => {
  let component: A8Component;
  let fixture: ComponentFixture<A8Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [A8Component]
    });
    fixture = TestBed.createComponent(A8Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
