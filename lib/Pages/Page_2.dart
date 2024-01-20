import 'dart:convert';

import 'package:axios_2/Pages/Page_3.dart';
import 'package:axios_2/models/movie_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget {
  const Page2({required this.list, super.key});

  final List<MovieClass> list;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<void> fetchMovieData(int index) async {
    String baseUrl =
        "https://www.omdbapi.com/?t=${widget.list[index].title}&y=${widget.list[index].year}&apikey=73e19683";

    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['Response'] == "False") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Movie Data not found"),
            ),
          );
        } else {
          print(responseBody['Title'].toString());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Page3(
                  title: responseBody['Title'],
                  imageUrl: responseBody['Poster'],
                  year: responseBody['Year'],
                  releasedDate: responseBody['Released'],
                  genre: responseBody['Genre'],
                  actors: responseBody['Actors'],
                );
              },
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Movie Data not found"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            fetchMovieData(index);
          },
          child: ListTile(
            leading: widget.list[index].poster != 'N/A'
                ? Image.network(
                    widget.list[index].poster!,
                    width: MediaQuery.of(context).size.width / 5,
                  )
                : Image.asset(
                    'assets/smiley.jpg',
                    width: MediaQuery.of(context).size.width / 5,
                  ),
            title: Text(widget.list[index].title!),
            subtitle: Text(widget.list[index].year!),
            trailing: Text(widget.list[index].type!),
          ),
        ),
      ),
    );
  }
}
