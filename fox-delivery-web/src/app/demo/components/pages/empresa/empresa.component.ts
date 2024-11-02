import { Component,OnInit } from '@angular/core';
import { CountryService } from 'src/app/demo/service/country.service';

@Component({
  selector: 'app-empresa',
  templateUrl: './empresa.component.html',
  styleUrl: './empresa.component.scss'
})
export class EmpresaComponent implements OnInit {


  countries: any[] = [];

  situacao: any[];

  filteredCountries: any[] = [];

  value1: any;

  value2: any;

  value3: any;

  value4: any;

  value5: any;

  value6: any;

  value7: any;

  value8: any;

  value9: any;

  value10: any;

  constructor(private countryService: CountryService) {
      this.situacao = [
          { name: 'Ativo' },
          { name: 'Inativo' },
      ];
  }

  ngOnInit() {
      this.countryService.getCountries().then(countries => {
          this.countries = countries;
      });
  }

  searchCountry(event: any) {
    
      const filtered: any[] = [];
      const query = event.query;
      for (let i = 0; i < this.countries.length; i++) {
          const country = this.countries[i];
          if (country.name.toLowerCase().indexOf(query.toLowerCase()) == 0) {
              filtered.push(country);
          }
      }

      this.filteredCountries = filtered;
  }
  
}


