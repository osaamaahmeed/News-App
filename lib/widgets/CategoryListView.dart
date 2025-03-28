import 'package:flutter/material.dart';
import 'package:news_cloud/models/category_model.dart';
import 'package:news_cloud/widgets/category_card.dart';

List<CategoryModel> categoryData = [
  CategoryModel(
      imageAssetUrl: "assets/business.avif", categoryName: "Business"),
  CategoryModel(
      imageAssetUrl: "assets/entertaiment.avif", categoryName: "Entertainment"),
  CategoryModel(imageAssetUrl: "assets/health.avif", categoryName: "Health"),
  CategoryModel(imageAssetUrl: "assets/science.avif", categoryName: "Science"),
  CategoryModel(imageAssetUrl: "assets/sports.avif", categoryName: "Sports"),
  CategoryModel(
      imageAssetUrl: "assets/technology.jpeg", categoryName: "Technology"),
];

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CategoryCard(item: categoryData[index]);
      },
    );
  }
}
