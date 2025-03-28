import 'package:flutter/material.dart';
import 'package:news_cloud/models/news_model.dart';
import 'package:news_cloud/widgets/news_caontainer.dart';



class NewsListView extends StatelessWidget {
  final List<NewsModel> newsData;
  const NewsListView({super.key, required this.newsData});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: newsData.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 17.5),
            child: NewsCaontainer(data: newsData[index]),
          );
        },
      ),
    );
  }
}


/*
ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: NewsCaontainer(data: newsData[index]),
        );
      },
    );
*/
