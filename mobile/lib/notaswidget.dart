import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mobile/models/notafiscal.dart";
import "package:mobile/notas_repository.dart";
import "package:mobile/views/notafiscal_page.dart";

class NotasWidget extends StatefulWidget {
  const NotasWidget({super.key});
  @override
  State<NotasWidget> createState() => _NotasWidgetState();
}

class _NotasWidgetState extends State<NotasWidget> {
  List<NotaFiscal> notas = NotasRepository.getNotas();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return (ListView.builder(
        itemCount: notas.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotafiscalPage(
                                notaFiscal: notas[index],
                              ))).then((_){
                                setState(() {
                                  notas = NotasRepository.getNotas();
                                });
                              });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(
                    15,
                  ),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
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
                        Expanded(child: Text(notas[index].id)),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(notas[index].emitente.nome),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(notas[index].valor),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat('dd/MM/yyyy')
                              .format(notas[index].data)),
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