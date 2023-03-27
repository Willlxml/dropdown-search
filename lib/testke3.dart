import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';

class DropdownSearchTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Search"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            asyncItems: (text) async {
              var response = await http
                  .get(Uri.parse("https://reqres.in/api/users?page=2"));
              if (response.statusCode != 200) {
                return [];
              }
              List allData = (json.decode(response.body) as Map<String, dynamic>)["data"];
              List<String> _allData = [];
              allData.forEach((element) {
                _allData.add(element["first_name"]);
              });
              return _allData;
            },
          ),
        ],
      ),
    );
  }
}
