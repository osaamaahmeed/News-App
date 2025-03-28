import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item, }); 
  final CategoryModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.imageAssetUrl))),
          child: Center(child: Text(item.categoryName, style: TextStyle(color: Colors.white, fontSize: 20),)),
        );
  }
}