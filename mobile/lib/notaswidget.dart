import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mobile/models/notafiscal.dart";
import "package:mobile/views/notafiscal_page.dart";

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