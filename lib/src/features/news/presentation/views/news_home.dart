import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qombo/src/features/news/data/helper/helper_category_model.dart';
import 'package:qombo/src/features/news/data/helper/helper_news.dart';
import 'package:qombo/src/features/news/presentation/widgets/category_card.dart';

import '../../domain/models/category_model.dart';
import '../widgets/news_tile.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  late bool _loading;
  var newslist;

  List<CategoryModel> categories = [];

  void getNews() async {
    HelperNews news = HelperNews();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading ?
        const Center(child: CircularProgressIndicator(),)
            : SingleChildScrollView(
          child: Column(
            children: [
              // Category cards
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(top: 12),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                    return CategoryCard(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categoryTitle: categories[index].categoryTitle,
                    );
                    }),
              ),

              // News articles
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
