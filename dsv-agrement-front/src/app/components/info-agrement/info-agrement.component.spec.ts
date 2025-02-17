import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoAgrementComponent } from './info-agrement.component';

describe('InfoAgrementComponent', () => {
  let component: InfoAgrementComponent;
  let fixture: ComponentFixture<InfoAgrementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [InfoAgrementComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(InfoAgrementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
