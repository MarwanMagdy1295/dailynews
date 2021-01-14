import 'package:dailynews/views/article_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;

  BlogTile({this.imageUrl, this.title, this.desc, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogURL: url,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black38, fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
