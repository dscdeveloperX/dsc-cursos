import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E8Component } from './e8.component';

describe('E8Component', () => {
  let component: E8Component;
  let fixture: ComponentFixture<E8Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E8Component]
    });
    fixture = TestBed.createComponent(E8Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
