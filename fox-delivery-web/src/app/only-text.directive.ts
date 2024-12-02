import { Directive } from '@angular/core';

@Directive({
  selector: '[appOnlyText]',
  standalone: true
})
export class OnlyTextDirective {

  constructor() { }

}
