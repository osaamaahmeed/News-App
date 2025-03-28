import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/news_model.dart';
import '../widgets/category_card.dart';
import '../widgets/news_caontainer.dart';

List<CategoryModel> categoryData = [
  CategoryModel(imageAssetUrl: "assets/business.avif", categoryName: "Business"),
  CategoryModel(imageAssetUrl: "assets/entertaiment.avif", categoryName: "Entertaiment"),
  CategoryModel(imageAssetUrl: "assets/general.avif", categoryName: "General"),
  CategoryModel(imageAssetUrl: "assets/health.avif", categoryName: "Health"),
  CategoryModel(imageAssetUrl: "assets/science.avif", categoryName: "Science"),
  CategoryModel(imageAssetUrl: "assets/sports.avif", categoryName: "Sports"),
  CategoryModel(imageAssetUrl: "assets/technology.jpeg", categoryName: "Technology"),
];

List<NewsModel> newsData = [
  NewsModel(img: "assets/news1.jpeg", mainNews: "What is Lorem Ipsum?", sideNews: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  NewsModel(img: "assets/news2.jpeg", mainNews: "Where does it come from?", sideNews: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
  NewsModel(img: "assets/news3.jpeg", mainNews: "Why do we use it?", sideNews: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letter"),
];

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("NewsApp"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return CategoryCard(item: categoryData[index]);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: newsData.length,
                itemBuilder: (context, index) {
                  return NewsCaontainer(data: newsData[index]);
                },
              ),
            ),
          ],
        )
      );
  }
}