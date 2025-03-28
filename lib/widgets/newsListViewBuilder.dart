import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_cloud/models/news_model.dart';
import 'package:news_cloud/services/news_service.dart';
import 'package:news_cloud/widgets/NewsListView.dart';

class Newslistviewbuilder extends StatefulWidget {
  final String category;
  const Newslistviewbuilder({super.key, required this.category});
  @override
  State<Newslistviewbuilder> createState() => _NewslistviewbuilderState();
}

class _NewslistviewbuilderState extends State<Newslistviewbuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<NewsModel>> (
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {return NewsListView(newsData: snapshot.data!);}
          else if (snapshot.hasError) {return SliverToBoxAdapter(child: Center(child: Text("Oops There was an error !")));}
          else {return SliverFillRemaining(hasScrollBody: false, child: Center(child: LoadingAnimationWidget.threeArchedCircle(color: Colors.black, size: 45))); }
        });
  }
}

/*
return isLoading
        ? SliverToBoxAdapter(
            child: Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.black, size: 45),
            ),
          )
        : newsData.isNotEmpty
            ? NewsListView(newsData: newsData)
            : SliverToBoxAdapter(
                child: Center(
                  child: Text("Oops There was an error !"),
                ),
              );
*/

/*
isLoading ? SliverToBoxAdapter(child: Center(child: LoadingAnimationWidget.threeArchedCircle(color: Colors.black, size: 45))) : SliverList(
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
 */

/*
SliverToBoxAdapter(child: Center(child: LoadingAnimationWidget.threeArchedCircle(color: Colors.black, size: 45)));

 */
