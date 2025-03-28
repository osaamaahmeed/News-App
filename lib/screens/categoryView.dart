import 'package:flutter/material.dart';
import 'package:news_cloud/widgets/newsListViewBuilder.dart';

class Categoryview extends StatelessWidget {
  final String category;
  const Categoryview({super.key, required this.category});

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
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [Newslistviewbuilder(category: category,)],
        ), 
      )
    );
  }
}