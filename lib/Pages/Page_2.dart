import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String title, imageUrl, year, releasedDate, genre, actors;

  const Page2(
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
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl != 'N/A'
                ? Image.network(
                    imageUrl,
                    width: MediaQuery.of(context).size.width / 2,
                  )
                : Image.asset(
                    'assets/smiley.jpg',
                    width: MediaQuery.of(context).size.width / 2,
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
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                Expanded(child: Text(title,style: TextStyle(fontSize: 20),))
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
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                Expanded(child: Text(year,style: TextStyle(fontSize: 20),))
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
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                Expanded(child: Text(releasedDate,style: TextStyle(fontSize: 20),))
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
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                Expanded(child: Text(genre,style: TextStyle(fontSize: 20),),)
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
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                Expanded(child: Text(actors,style: TextStyle(fontSize: 20),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
