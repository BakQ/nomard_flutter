import 'package:flutter/material.dart';

class Movie_S extends StatelessWidget {
  final String backdropPath, title, id;

  const Movie_S({
    super.key,
    required this.id,
    required this.title,
    required this.backdropPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: id,
          child: Container(
            width: 180,
            height: 180,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              backdropPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 180, // 텍스트가 이 너비를 넘지 않도록 제한
          child: Text(
            title,
            textAlign: TextAlign.center, // 텍스트를 가운데 정렬
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, // 텍스트가 잘리지 않고 줄바꿈되도록 설정
            maxLines: 2, // 최대 2줄로 표시
            softWrap: true, // 텍스트를 자동으로 줄바꿈
          ),
        ),
      ],
    );
  }
}
