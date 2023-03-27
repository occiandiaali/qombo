import 'package:flutter/material.dart';
import 'package:qombo/src/features/news/data/helper/helper_news.dart';

import '../widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  const CategoryNews({Key? key, required this.newsCategory}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }
  void getNews() async {
    HelperNewsForCategory news = HelperNewsForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ?
      const Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: newslist.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
              return NewsTile(
                imgUrl: newslist[index].urlToImage ?? "",
                title: newslist[index].title ?? "",
                desc: newslist[index].description ?? "",
                content: newslist[index].content ?? "",
                postUrl: newslist[index].articleUrl ?? "",
              );
              }),
        ),
      ),
    );
  }
}
