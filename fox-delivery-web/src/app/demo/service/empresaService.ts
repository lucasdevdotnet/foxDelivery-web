import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Empresa } from '../model/empresa';


@Injectable()
export class EmpresaService {

    //apiURL = 'https://192.168.1.105/v1/api';
    apiURL = 'https://localhost:44376/v1/api';
    constructor(private http: HttpClient) { }


    getEmpresas() {  //poste
        return this.http.get<any>('assets/demo/data.json') //api
            .toPromise()
            .then(res => res.data as Empresa[])
            .then(data => data);
    }

    adicionar(empresa: Empresa): any {

        debugger
        return this.http.post(`${this.apiURL}/Empresa`, empresa)
            .subscribe(
                resultado => {
                    console.log(resultado)
                },
                erro => {
                    if (erro.status == 400) {
                        console.log(erro);
                    }
                }
            );
    }
}
