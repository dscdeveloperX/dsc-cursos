import { TestBed } from '@angular/core/testing';

import { ClubRestService } from './club-rest.service';

describe('ClubRestService', () => {
  let service: ClubRestService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ClubRestService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
