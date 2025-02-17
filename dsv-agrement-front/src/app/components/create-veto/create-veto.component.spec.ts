import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateVetoComponent } from './create-veto.component';

describe('CreateVetoComponent', () => {
  let component: CreateVetoComponent;
  let fixture: ComponentFixture<CreateVetoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CreateVetoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CreateVetoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
