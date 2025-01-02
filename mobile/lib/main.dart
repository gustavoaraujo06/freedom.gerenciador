import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/pessoa_fisica.dart';
import 'package:mobile/models/pessoa_juridica.dart';
import 'package:mobile/models/endereco.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/models/produto.dart';
import 'package:mobile/views/notafiscal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'This is Something',
        home: Scaffold(
            body: Center(
          child: NotasWidget(notas: [
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
          ]),
        )));
  }
}

class NotasWidget extends StatefulWidget {
  final List<NotaFiscal> notas;
  const NotasWidget({super.key, required this.notas});
  @override
  State<NotasWidget> createState() => _NotasWidgetState();
}

class _NotasWidgetState extends State<NotasWidget> {
  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
        itemCount: widget.notas.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotafiscalPage(
                                notaFiscal: widget.notas[index],
                              )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(
                    15,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(child: Text(widget.notas[index].id)),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.notas[index].emitente.nome),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(widget.notas[index].valor),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat('dd/MM/yyyy')
                              .format(widget.notas[index].data)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          );
        }));
  }
}
