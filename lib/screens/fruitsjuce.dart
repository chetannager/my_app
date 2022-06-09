import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/screens/jucedetails.dart';
import 'package:my_app/services/juiceService.dart';

class FruitsJuce extends StatefulWidget {
  const FruitsJuce({Key key}) : super(key: key);

  @override
  State<FruitsJuce> createState() => _FruitsJuceState();
}

class _FruitsJuceState extends State<FruitsJuce> {
  bool isSearching = false;
  List<dynamic> fruitsJuice = [];

  Future fetchFruitsJuice(searchTerm) async {
    setState(() {
      isSearching = true;
    });
    juiceService _juiceService = juiceService();
    _juiceService.searchJuice(searchTerm).then((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        dynamic DRINKS = responseBody["drinks"];
        if (DRINKS != null) {
          setState(() {
            fruitsJuice = DRINKS;
          });
        } else {
          /// handle error from there
        }
      } else {
        // show some toast here in error
      }
      setState(() {
        isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruits Juice"),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              child: TextField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Search here....",
                    prefixIcon: const Icon(Icons.search)),
                onChanged: (value) {
                  print(value);
                  if (value.length > 0) {
                    fetchFruitsJuice(value);
                  }
                },
              ),
            ),
            Expanded(
              child: isSearching
                  ? Center(
                      child: const CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: fruitsJuice.length,
                      itemBuilder: (context, item) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                                fruitsJuice[item]["strDrinkThumb"]),
                            radius: 25.0,
                          ),
                          title: Text(fruitsJuice[item]["strDrink"].toString()),
                          subtitle:
                              Text(fruitsJuice[item]["strCategory"].toString()),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JuceDetails(fruitsJuice[item])));
                          },
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
