class AnimationsContent {
  String id;
  String featuredImage;
  String title;
  String curriculum;
  String grade;
  String course;
  String unit;
  String videoUrl;
  String slug;
  String contentCreator;
  String createAt;
  AnimationsContent(
      {required this.id,
      required this.featuredImage,
      required this.contentCreator,
      required this.course,
      required this.curriculum,
      required this.grade,
      required this.slug,
      required this.title,
      required this.unit,
      required this.videoUrl,
      required this.createAt});
}

//Dummies Constants to use for.

List<AnimationsContent> animations = [
  AnimationsContent(
      id: 'Animation1',
      featuredImage:
          'https://cdn.pixabay.com/photo/2015/07/27/20/16/book-863418_1280.jpg',
      contentCreator: 'Aime Ndayambaje',
      course: 'Mathematics',
      curriculum: 'Rwanda Curriculum',
      grade: 'D2',
      slug: 'Slug',
      title: 'The Book Title Should Go Here',
      unit: 'Chapter 1',
      videoUrl:
          'https://media.istockphoto.com/videos/little-kids-happy-avatars-characters-video-id1217274252',
      createAt: '28 March 2018'),
  AnimationsContent(
      id: 'animation2',
      featuredImage:
          'https://cdn.pixabay.com/photo/2017/02/01/13/52/kids-2030260_1280.jpg',
      contentCreator: 'Aime Ndayambaje',
      course: 'Mathematics',
      curriculum: 'Rwanda Curriculum',
      grade: 'D2',
      slug: 'Slug',
      title: 'The Book Title Should Go Here',
      unit: 'Chapter 1',
      videoUrl:
          'https://media.istockphoto.com/videos/full-or-medium-shot-of-black-stork-or-ciconia-nigra-bird-family-or-video-id1404647191',
      createAt: '28 July 2018'),
];
