import 'dart:convert';
import 'package:axios_2/Pages/Page_2.dart';
import 'package:axios_2/models/movie_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool isLoading = false;
  final TextEditingController _textFieldController = TextEditingController();
  String fetchedData = '';
  Future<void> fetchData() async {
    String baseUrl =
        "https://www.omdbapi.com/?s=${_textFieldController.text}&apikey=73e19683";

    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['Response'] == "False") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error:- Not found any data !"),
            ),
          );
        } else {
          print(responseBody['Search'][0]['Title'].toString());
          List<MovieClass> movies =
              MovieClass.fromJsonList(responseBody['Search']);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Page2(
                  list: movies,
                );
              },
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something went wrong"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 201, 62),
        centerTitle: true,
        title: Text('Axios_session : 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: 'Enter Movie Title',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 247, 201, 62),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                fetchData();
                setState(() {
                  isLoading = false;
                });
              },
              child: isLoading ? const CircularProgressIndicator() : const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
