import 'package:flutter/material.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/pessoa_fisica.dart';
import 'package:mobile/models/pessoa_juridica.dart';

class NotafiscalPage extends StatelessWidget {
  final NotaFiscal notaFiscal;
  const NotafiscalPage({super.key, required this.notaFiscal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Nota Fiscal"),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotaFiscalCard(
                      label: "Dados NF",
                      children: [
                        [
                          NotaFiscalField(
                              label: "Numero NF", value: notaFiscal.id)
                        ],
                        [
                          NotaFiscalField(
                            label: "Data",
                            value: DateFormat('dd/MM/yyyy')
                                .format(notaFiscal.data),
                          ),
                          NotaFiscalField(
                              label: "Valor",
                              value:
                                  NumberFormat.simpleCurrency(locale: 'pt_BR')
                                      .format(notaFiscal.valor))
                        ]
                      ],
                    ),
                    NotaFiscalCard(label: "Emitente", children: [
                      [
                        NotaFiscalField(
                            label: "Nome/Razão Social",
                            value: notaFiscal.emitente.nome)
                      ],
                      [
                        notaFiscal.emitente is PessoaFisica
                            ? NotaFiscalField(
                                label: "CPF",
                                value:
                                    (notaFiscal.emitente as PessoaFisica).cpf)
                            : NotaFiscalField(
                                label: "CNPJ",
                                value: (notaFiscal.emitente as PessoaJuridica)
                                    .cnpj)
                      ],
                      [
                        NotaFiscalField(
                            label: "Endereco",
                            value: notaFiscal.emitente.endereco.toString())
                      ]
                    ]),
                    NotaFiscalCard(label: "Produtos", children: [
                      [
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                return SingleChildScrollView(
                                      child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Produtos",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Table(
                                          border: TableBorder.all(),
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                ),
                                                children: [
                                                  TableCell(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Text("NOME"))),
                                                  TableCell(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child:
                                                              Text("VALOR"))),
                                                  TableCell(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child:
                                                              Text("UNIDADE"))),
                                                  TableCell(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Text("QNTD"))),
                                                  TableCell(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child:
                                                              Text("TOTAL"))),
                                                ]),
                                            ...(notaFiscal.produtos
                                                .map((produto) {
                                              return TableRow(children: [
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child:
                                                        Text(produto.descricao),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Text(
                                                        NumberFormat.currency(
                                                                locale: "pt_BR",
                                                                symbol: '',
                                                                decimalDigits:
                                                                    2)
                                                            .format(
                                                                produto.valor)),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Text(produto
                                                        .unidadeComercial),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Text(produto
                                                        .quantidade
                                                        .toString()),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: Text(
                                                        NumberFormat.currency(
                                                                locale: "pt_BR",
                                                                symbol: '',
                                                                decimalDigits:
                                                                    2)
                                                            .format(
                                                                produto.total)),
                                                  ),
                                                )
                                              ]);
                                            }))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                                });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black),
                          child: Text("Ver Produtos"),
                        ),
                      ]
                    ]),
                    NotaFiscalCard(label: "Impostos", children: [
                      [
                        TextButton(
                            onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        children: [
                                          Text("ICMS:"),
                                          Text("IPI:"),
                                          Text("PIS:"),
                                          Text("COFINS:"),
                                          Text("CSLL:"),
                                          Text("IRPJ:"),
                                        ],
                                      )
                                    ],
                                  );
                                }),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.black),
                            child: Text("Ver Impostos")),
                      ]
                    ])
                  ]))
        ],
      ),
    );
  }
}

class NotaFiscalField extends StatelessWidget {
  final String label;
  final String value;

  const NotaFiscalField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class NotaFiscalCard extends StatelessWidget {
  final String label;
  final List<List<Widget>> children;
  const NotaFiscalCard({super.key, required this.label, required this.children});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Card(
            color: Colors.white,
            surfaceTintColor: Colors.yellow,
            shadowColor: Colors.black,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  spacing: 10.0,
                  children: children
                      .map((e) => Row(
                          mainAxisSize: MainAxisSize.max,
                          children: e.map((e) => Expanded(child: e)).toList()))
                      .toList(),
                )))
      ],
    );
  }
}
