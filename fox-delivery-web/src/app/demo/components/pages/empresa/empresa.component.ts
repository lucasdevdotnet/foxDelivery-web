import { Component, OnInit } from '@angular/core';
import { CountryService } from 'src/app/demo/service/country.service';
import { EmpresaService } from 'src/app/demo/service/empresaService';
import { Empresa } from 'src/app/demo/model/empresa';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
@Component({
  selector: 'app-empresa',
  templateUrl: './empresa.component.html',
  styleUrl: './empresa.component.scss'
})
export class EmpresaComponent implements OnInit {

  postEmpresa: FormGroup;


  countries: any[] = [];

  situacao: any[];
  empresa: Empresa = {};
  idsituacao: string = '';
  nome: string = '';
  cnpj: string = '';
  nomefantasia: string = '';
  motivobloqueio: string = '';
  filteredCountries: any[] = [];


  constructor(private countryService: CountryService,private fb: FormBuilder, private empresaService: EmpresaService) {
    this.situacao = [
      { name: 'Ativo' },
      { name: 'Inativo' },
    ];
  }

  ngOnInit() {
    this.empresaService.getEmpresas().then(countries => {
      this.countries = countries;
    });
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
  adicionar() {

    this.postEmpresa = this.fb.group({
      ativo: [false],
    });
    if (this.postEmpresa.valid) {
      const formData = this.postEmpresa.value;
      console.log('Enviando dados do formulário:', formData);
    }
debugger
    if (this.postEmpresa.valid) {
      this.empresaService.adicionar(this.postEmpresa.value).subscribe(
        response => {
          console.log('Post criado com sucesso!', response);
          this.postEmpresa.reset();
        },
        error => {
          console.error('Erro ao criar post:', error);
        }
      );
    }

  }
  // onSubmit() {
  //   debugger
  //   if (this.postEmpresa.valid) {
  //     this.empresaService.adicionar(this.postEmpresa.value).subscribe(
  //       response => {
  //         console.log('Post criado com sucesso!', response);
  //         this.postEmpresa.reset();
  //       },
  //       error => {
  //         console.error('Erro ao criar post:', error);
  //       }
  //     );
    //}
}
//}
   
  



