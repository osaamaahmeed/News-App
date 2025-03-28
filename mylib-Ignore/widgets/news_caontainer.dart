import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsCaontainer extends StatelessWidget {
  const NewsCaontainer({super.key, required this.data});
  final NewsModel data;
  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
    return SizedBox(
            width: width - 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage(data.img),
                        fit: BoxFit.cover,
                      )),
                      
                ),
                Text(
                  data.mainNews,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  data.sideNews,
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
              ],
            ),
          );
  }
}