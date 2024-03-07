import 'package:flutter/material.dart';
import 'package:swachhta_app2/data/dummy_data.dart';
import 'package:swachhta_app2/news/news_model.dart';

import 'article_view.dart';

class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.article});

  final Article article;
  @override
  State<NewsTile> createState() {
    return _NewsTile();
  }
}

class _NewsTile extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: widget.article.articleUrl,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: Opacity(
              opacity: 0.8,
              child: Image.network(
                widget.article.urlToImage,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:const EdgeInsets.only(left: 10, right: 8, top: 4),
              child:Text(
              widget.article.title,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),)
          ),
        ],
      ),
    );
  }
}
