import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Column(
        children: [
          CardBanner(imageUr1: article.urlToImage),
          CardDetail(article: article),
        ],
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  final String? imageUr1;
  const CardBanner({Key? key, this.imageUr1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            imageUr1!,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.bookmark_border, size: 32),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class CardDetail extends StatelessWidget {
  final Article? article;

  const CardDetail({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            article!.title,
            style: const TextStyle(fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Text(article!.source),
              const Spacer(),
              const Text('45 Comments'),
            ],
          )
        ],
      ),
    );
  }
}
