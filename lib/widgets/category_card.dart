import 'package:flutter/material.dart';
import 'package:news_cloud/screens/categoryView.dart';
import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.item,
  });
  final CategoryModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Categoryview(category: item.categoryName,);
        }));
      },
      child: Container(
        height: 150,
        width: 200,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(item.imageAssetUrl),
              fit: BoxFit.cover,
            )),
        child: Center(
            child: Text(
          item.categoryName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
