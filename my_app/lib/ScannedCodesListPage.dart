import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScannedCodesListPage extends StatelessWidget {
  final List<String> scannedCodes;

  ScannedCodesListPage({required this.scannedCodes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des codes scannés'),
      ),
      body: ListView.builder(
        itemCount: scannedCodes.length,
        itemBuilder: (context, index) {
          String code = scannedCodes[index];
          String tag = (code.endsWith("812")) ? ": APE" : (code.endsWith("813")) ? ": APAE" : "";
          return ListTile(
            title: Text(code + tag),
          );
        },
      ),
    );
  }
}
