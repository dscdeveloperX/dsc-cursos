import { ComponentFixture, TestBed } from '@angular/core/testing';

import { A5Component } from './a5.component';

describe('A5Component', () => {
  let component: A5Component;
  let fixture: ComponentFixture<A5Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [A5Component]
    });
    fixture = TestBed.createComponent(A5Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
