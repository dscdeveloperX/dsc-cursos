import { ComponentFixture, TestBed } from '@angular/core/testing';

import { A9Component } from './a9.component';

describe('A9Component', () => {
  let component: A9Component;
  let fixture: ComponentFixture<A9Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [A9Component]
    });
    fixture = TestBed.createComponent(A9Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
