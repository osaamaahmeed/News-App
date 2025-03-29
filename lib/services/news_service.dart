
import 'package:dio/dio.dart';
import 'package:news_cloud/models/news_model.dart';

class NewsService {

final Dio dio = Dio();

Future<List<NewsModel>> getNews ({required String category}) async {

  try {
  Response res = await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=You rAPIKey&category=$category");
  Map<String, dynamic> jsonData = res.data;
  List<dynamic> articles = jsonData['articles'];
  // if (res.statusCode == 403) {return NewsModel(img: "assetss/news1.jpeg", title: articles['title'], subTitle: articles['descptiom']);}
  List<NewsModel> newsData = [];
  for (var article in articles) {
    NewsModel news = NewsModel.fromJSON(article);
    newsData.add(news);
  }
  return newsData;
} catch (e) {
  return [
    NewsModel(newsUrl: "", img: "", title: "Unable to load the API", subTitle: "")
  ];
}
}
}