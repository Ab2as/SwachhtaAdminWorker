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
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Opacity(
              opacity: 0.6,
              child: Image.network(
                widget.article.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 140,
            child: Text(
              widget.article.title,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 160,
            child: Text(
              widget.article.description,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Container(

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          )),

  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.article.title,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                  ),
                ),
                Expanded(
                  child: Text(widget.article.description),
                ),
              ]),
        ],
      ),
    )
 */
