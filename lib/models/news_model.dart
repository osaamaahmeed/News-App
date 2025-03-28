class NewsModel {
  final String? img;
  final String title;
  final String? subTitle;
  final String newsUrl;
  NewsModel({required this.newsUrl, required this.img, required this.title, required this.subTitle});

  factory NewsModel.fromJSON(json) {
    return NewsModel(img: json['urlToImage'], title: json['title'], subTitle: json['description'], newsUrl: json['url']);
  }
}