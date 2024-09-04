import { ComponentFixture, TestBed } from '@angular/core/testing';

import { E4Component } from './e4.component';

describe('E4Component', () => {
  let component: E4Component;
  let fixture: ComponentFixture<E4Component>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [E4Component]
    });
    fixture = TestBed.createComponent(E4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
