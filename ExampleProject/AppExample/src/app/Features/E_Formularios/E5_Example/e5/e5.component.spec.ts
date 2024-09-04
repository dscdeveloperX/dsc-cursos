import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E5Component } from './e5.component';

describe('E5Component', () => {
  let component: E5Component;
  let fixture: ComponentFixture<E5Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E5Component]
    });
    fixture = TestBed.createComponent(E5Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
