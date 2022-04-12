class Media {
  String imageUrl;


  Media({
    required this.imageUrl
});

  factory Media.fromJson(Map<dynamic,dynamic> json){
    return Media(imageUrl: json['src']['original']);
  }
}