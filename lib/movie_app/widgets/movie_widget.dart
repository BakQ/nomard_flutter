import 'package:flutter/material.dart';
import 'package:homework/movie_app/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String posterPath, title, id;

  const Movie({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push : 화면 이동
        Navigator.push(
          context,
          // MaterialPageRoute : 화면 이동 위젯
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              posterPath: posterPath,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 330,
              height: 230,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                posterPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
