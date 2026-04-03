import { TestBed } from '@angular/core/testing';

import { CustomerDataService } from './customer-data.service';

describe('CustomerDataService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CustomerDataService = TestBed.inject(CustomerDataService);
    expect(service).toBeTruthy();
  });
});
