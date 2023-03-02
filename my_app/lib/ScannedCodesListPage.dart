import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


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
          String code = scannedCodes[index].substring(0, 8);
          return ListTile(
            title: Text(code),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _compareWithOtherList(context),
        child: Icon(Icons.compare_arrows),
      ),
    );
  }

  Future<void> _compareWithOtherList(BuildContext context) async {
    // Charger la liste à partir du fichier JSON
    String jsonString = await rootBundle.loadString('lib/students.json');
    Map<String, dynamic> otherList = jsonDecode(jsonString);

    // Comparer les deux listes et créer une liste de codes non correspondants
    List<String> unmatchedCodes = [];
    for (String code in scannedCodes) {
      if (!otherList.values.contains(code)) {
        unmatchedCodes.add(code);
      }
    }

    // Afficher la liste de codes non correspondants dans une nouvelle page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MissingStudentsPage(unmatchedCodes: unmatchedCodes),
      ),
    );
  }
}

class MissingStudentsPage extends StatelessWidget {
  final List<String> unmatchedCodes;

  MissingStudentsPage({required this.unmatchedCodes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Étudiants manquants'),
      ),
      body: ListView.builder(
        itemCount: unmatchedCodes.length,
        itemBuilder: (context, index) {
          String code = unmatchedCodes[index].substring(0, 8);
          return ListTile(
            title: Text(code),
          );
        },
      ),
    );
  }
}

