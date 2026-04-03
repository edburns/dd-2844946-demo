import { TestBed } from '@angular/core/testing';

import { HardcodedAuthenticationService } from './hardcoded-authentication.service';

describe('HardcodedAuthenticationService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: HardcodedAuthenticationService = TestBed.inject(HardcodedAuthenticationService);
    expect(service).toBeTruthy();
  });
});
