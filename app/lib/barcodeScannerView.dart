import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerView extends StatefulWidget {
  @override
  _BarcodeScannerViewState createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leitor de Código de Barras')),
      body: MobileScanner(
        controller: controller,
        onDetect: (barcode) async {
          final List<Barcode> code = barcode.barcodes;
          if (code.isNotEmpty) {
            controller.stop();
            final url = Uri.parse('https://gateway.apiserpro.serpro.gov.br/token');
            final headers = {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'Basic THV3Vlh1RFdSZFhGZEYySW1CYkM3NndZZVJrYTpfTmZhVkU0TUtCdkJ3NXJ4bFRpcnlfZmpOUFlh'
            };
            final body = {
              'grant_type': 'client_credentials',
            };
            try{
              final response = await http.post(url, headers: headers, body: body);
              if(response.statusCode == 200){
                final data = jsonDecode(response.body);
                final token = data['access_token'];
                final headersNfe = {
                  'Authorization': 'Bearer $token',
                };
                final urlNfe = Uri.parse('https://gateway.apiserpro.serpro.gov.br/consulta-nfe-df/api/v1/nfe/${code.first.rawValue}');
                final responseNfe = await http.get(urlNfe, headers: headersNfe);
                if(responseNfe.statusCode == 200){
                  final dataNfe = jsonDecode(responseNfe.body);
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('NF-e Encontrada!'),
                      content: Text('Valor NF-e: ${dataNfe['nfeProc']['NFe']['infNFe']['total']['ICMSTot']['vNF']}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  });
                }else{
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('NF-e não encontrada!'),
                      content: Text('Código de Barras: ${code.first.rawValue}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  });
                }
              }
            }catch(e){
              print(e);
            }
            controller.start();
          }
        },
      ),
    );
  }
}