import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mobile/notas_repository.dart";
import "package:mobile/views/notafiscal_page.dart";
import "package:provider/provider.dart";

class NotasWidget extends StatelessWidget {
  const NotasWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Consumer<NotasRepository>(builder: (context, notasRepo, child){
      return ListView.builder(
        itemCount: notasRepo.notas.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotafiscalPage(
                                notaFiscal: notasRepo.notas[index],
                              )));
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
                        Expanded(child: Text(notasRepo.notas[index].id)),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(notasRepo.notas[index].emitente.nome),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(notasRepo.notas[index].valor),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat('dd/MM/yyyy')
                              .format(notasRepo.notas[index].data)),
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
        });
    });
  }
}
