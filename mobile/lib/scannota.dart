import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanNota extends StatefulWidget {
  const ScanNota({super.key});

  @override
  State<ScanNota> createState() => _ScanNotaState();
}

class _ScanNotaState extends State<ScanNota> {
  final MobileScannerController controller = MobileScannerController();

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    if (barcode.rawValue == null) return;
    Navigator.of(context).pop(barcode.rawValue);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: MobileScanner(
          controller: controller,
          onDetect: _onDetect,
        ),
      ),
    );
  }
}