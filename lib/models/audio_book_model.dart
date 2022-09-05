class AudioBook {
  int id;
  String title, author, audioUrl;
  DateTime createdAt;
  AudioBook(
      {required this.audioUrl,
      required this.author,
      required this.createdAt,
      required this.id,
      required this.title});
}

List<AudioBook> audioBooks = <AudioBook>[
  AudioBook(
      audioUrl:
          "https://res.cloudinary.com/dofeqwgfb/video/upload/v1662049509/guitar-electro-sport-trailer-115571_hxuzim.mp3",
      author: "Augmented Future",
      createdAt: DateTime.now(),
      id: 1,
      title: "Amazi n'umuriro"),
  AudioBook(
      audioUrl:
          "https://res.cloudinary.com/dofeqwgfb/video/upload/v1662049509/guitar-electro-sport-trailer-115571_hxuzim.mp3",
      author: "ImagineWePub",
      createdAt: DateTime.now(),
      id: 2,
      title: "Mazi ya teke"),
];
