import 'dart:convert';
import 'package:axios_2/pages/movie_screen.dart';
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
    setState(() {
      isLoading = true;
    });
    String baseUrl =
        "https://www.omdbapi.com/?t=${_textFieldController.text}&apikey=73e19683";

    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                fetchData();
              },
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
