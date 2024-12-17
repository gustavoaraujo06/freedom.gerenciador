import 'package:flutter/material.dart';
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
        onDetect: (barcode) {
          final Object? code = barcode.raw;
          if (code != null) {
            print('Código detectado: $code');
            // Você pode navegar para outra tela ou exibir o código
          }
        },
      ),
    );
  }
}