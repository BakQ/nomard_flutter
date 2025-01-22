import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/movie_app/models/movie_detail.dart';
import 'package:homework/movie_app/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, posterPath, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel?> detailMove;

  @override
  void initState() {
    super.initState();
    detailMove = ApiService.getMovieDetailModel(widget.id);
  }

  Widget buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.yellow, size: 20),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.yellow, size: 20),
        for (int i = 0; i < emptyStars; i++)
          const Icon(Icons.star_border, color: Colors.yellow, size: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: NetworkImage(widget.posterPath),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Back to list",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 200),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: detailMove,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildStarRating(snapshot.data!.voteAverage / 2),
                              const SizedBox(height: 20),
                              Text(
                                '${snapshot.data!.runtime} min | ${snapshot.data!.genres.map((genre) => genre).join(", ")} ',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Storyline',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                snapshot.data!.overview,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.only(bottom: 40), // 아래로 40px 띄우기
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 50,
                child: CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  onPressed: () {},
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                  child: const Text(
                    'Buy ticket',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
