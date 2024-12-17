import { TestBed } from '@angular/core/testing';

import { AnimalRestService } from './animal-rest.service';

describe('AnimalRestService', () => {
  let service: AnimalRestService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AnimalRestService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
