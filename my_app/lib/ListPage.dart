import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> _logins = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
  try {
    final response = await http.get(Uri.parse('https://intra-api.etna-alternance.net/trombi/813'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final students = data['students'] as List<dynamic>;
      setState(() {
        _logins = students.map((student) => student['login'] as String).toList();
      });
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching students: $e');
    rethrow;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: ListView.builder(
        itemCount: _logins.length,
        itemBuilder: (context, index) {
          final login = _logins[index];
          return ListTile(
            title: Text(login),
          );
        },
      ),
    );
  }
}
