import 'package:flutter/material.dart';
import 'package:homework/movie_app/models/movie.dart';
import 'package:homework/movie_app/services/api_service.dart';
import 'package:homework/movie_app/widgets/movie_small_widget.dart';
import 'package:homework/movie_app/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<MovieModel>> popularMovies = ApiService.getPopularMoves();
    Future<List<MovieModel>> nowMovies = ApiService.getNowMoves();
    Future<List<MovieModel>> comingMovies = ApiService.getCommingMoves();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Popular Movies',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          //왜 Expanded는 사용할수 없는가? 더위에는 sizedbox 했어야했다...
                          child: makePopularList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            //const SizedBox(height: 20), // 두 FutureBuilder 간 간격 줄이기
            //여기를 sizedbox를안해서 시간을 다보냄....
            SizedBox(
              height: 320, // 부모 높이를 고정
              child: FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Now in Cinemas',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // 텍스트와 리스트 간 간격
                        Expanded(
                          child:
                              makeNowList(snapshot), // ListView를 Expanded로 감싸기
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: comingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Coming soon',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: makeComingList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makePopularList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          title: movie.title,
          id: movie.id,
          posterPath: movie.posterPath,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }

  ListView makeNowList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie_S(
          title: movie.title,
          id: movie.id,
          backdropPath: movie.posterPath,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }

  ListView makeComingList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie_S(
          title: movie.title,
          id: movie.id,
          backdropPath: movie.posterPath,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
