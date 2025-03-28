import 'package:flutter/material.dart';
import 'package:news_cloud/screens/webView.dart';
import '../models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCaontainer extends StatelessWidget {
  const NewsCaontainer({super.key, required this.data});
  final NewsModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Webview(newsLink: data.newsUrl);
        }));
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: data.img ??
                      "https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  progressIndicatorBuilder: (context, url, DownloadProgress) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.network("https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                )),
            Text(
              data.title,
              style: TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              data.subTitle ?? " ... ",
              maxLines: 2,
              style: TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

// data.img != null ? NetworkImage(data.img!) : AssetImage("assets/news1.jpeg")
//CachedNetworkImageProvider(data.img!)

/*
ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: data.img != null
                    ? NetworkImage(data.img!)
                    : AssetImage("assets/news1.jpeg"),
                height: 175,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
 */

/*
CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 175,
              width: double.infinity,
            ),
            imageUrl: data.img!,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>Icon(Icons.error),
          ),
 */

// NetworkImage(data.img??"https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=1024x1024&w=is&k=20&c=blBt3PJbOSEZF5_zB5YgKYeq9Zx_RMOLntX_nI3lliQ=")
