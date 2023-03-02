import 'package:flutter/material.dart';

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
