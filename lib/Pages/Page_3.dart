import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String title, imageUrl, year, releasedDate, genre, actors;

  const Page3(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.year,
      required this.releasedDate,
      required this.genre,
      required this.actors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$title'),
        backgroundColor: Color.fromARGB(255, 247, 201, 62),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl != 'N/A'
                ? Image.network(
                    imageUrl,
                    width: MediaQuery.of(context).size.width / 5,
                  )
                : Image.asset(
                    'assets/smiley.jpg',
                    width: MediaQuery.of(context).size.width / 5,
                  ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Movie Title :',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(title))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Year :',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(year))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Released Date:',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(releasedDate))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Genre :',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(genre))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Text(
                    'Actors :',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(actors))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
