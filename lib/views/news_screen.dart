import 'package:flutter/material.dart';
import 'package:projectfinal_bootcamp/helper/news_data.dart';
import 'package:projectfinal_bootcamp/models/article_model.dart';
import 'package:projectfinal_bootcamp/views/article_view.dart';
import 'package:projectfinal_bootcamp/widget/brandName.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  getNewsData() async {
    NewsData newsClass = NewsData();
    await newsClass.getNewsData();
    articles = newsClass.newsData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: brandName(),
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return BlogContent(
                                    imageUrl: articles[index].urlToImage,
                                    title: articles[index].title,
                                    desc: articles[index].description,
                                    url: articles[index].url);
                              })
                        ],
                      )),
                ),
              ));
  }
}

class BlogContent extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogContent(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleView(
                        blogUrl: url,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(color: Colors.black45),
            )
          ]),
        ));
  }
}
