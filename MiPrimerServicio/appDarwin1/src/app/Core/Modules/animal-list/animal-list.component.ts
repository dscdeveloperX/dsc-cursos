import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimalRestService } from '../../Services/animal-rest.service';
import { IAnimalResponse } from '../../Models/ianimal-response';

@Component({
  selector: 'app-animal-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './animal-list.component.html',
  styleUrls: ['./animal-list.component.css']
})
export class AnimalListComponent {



  public AnimaData = signal<IAnimalResponse[]>([]);


  constructor(private animalRestService: AnimalRestService){

  }
 



  public AnimalLista():void 
  {
    this.animalRestService.GetAnimal().subscribe(
      {
        next: (data:IAnimalResponse[])=>{
          this.AnimaData.set(data);
        }

      }
    );

  }



}