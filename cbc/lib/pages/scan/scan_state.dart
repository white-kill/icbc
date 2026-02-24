import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScanState {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  ScanState() {
    ///Initialize variables
  }
}
