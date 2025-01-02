import 'package:mobile/models/endereco.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/models/pessoa_fisica.dart';
import 'package:mobile/models/pessoa_juridica.dart';
import 'package:mobile/models/produto.dart';

class NotasRepository {
  static final List<NotaFiscal> _notas = [
            NotaFiscal(
              id: '53211034274233001257550000017556861371032230',
              valor: 150.0,
              data: DateTime(2023, 1, 1),
              // Emitente é uma PessoaJuridica
              emitente: PessoaJuridica(
                cnpj: '00.000.000/0001-01',
                nome: 'FREEDOM IT LTDA CHUPISCO MARAGAO',
                endereco: Endereco(
                    municipio: 'Itapeva', estado: 'SP', pais: 'Brasil'),
              ),
              // Destinatário é uma PessoaFisica
              destinatario: PessoaFisica(
                cpf: '111.111.111-11',
                nome: 'Cliente 1',
                endereco: Endereco(
                    municipio: 'Itapeva', estado: 'SP', pais: 'Brasil'),
              ),
              produtos: [
                Produto(
                    descricao: 'Pinto de Borracha',
                    valor: 150.0,
                    quantidade: 1,
                    unidadeComercial: 'UN'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
                Produto(
                    descricao: 'Pinto de Borracha SOB MEDIDA',
                    valor: 9.0,
                    quantidade: 25,
                    unidadeComercial: 'CM'),
              ],
            ),
          ];
          static getNotas(){
            return _notas;
          }
}