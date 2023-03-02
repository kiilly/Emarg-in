import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ListPage.dart';
import 'package:my_app/ScannedCodesListPage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  List<String> scannedCodes = [];
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan de code QR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Scan effectué : ${scannedCodes.isNotEmpty ? scannedCodes.last.substring(0, 8) : 'Scannez un code'}',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScannedCodesListPage(
                    scannedCodes: scannedCodes,
                  ),
                ),
              );
            },
            child: Icon(Icons.check),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(),
                ),
              );
            },
            child: Icon(Icons.close),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!scannedCodes.contains(scanData.code)) {
        setState(() {
          scannedCodes.add(scanData.code!);
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
