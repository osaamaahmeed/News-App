import 'package:flutter/material.dart';
import 'package:news_cloud/widgets/CategoryListView.dart';
import 'package:news_cloud/widgets/newsListViewBuilder.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text("Cloud",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 150, child: CategoryListView(),) ),
              Newslistviewbuilder(category: 'general',),
            ],
          ),
        ));
  }
}
