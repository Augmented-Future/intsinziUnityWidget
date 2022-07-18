class AnimationsContent {
  String featuredImage;
  String title;
  String curriculum;
  String grade;
  String course;
  String unit;
  String webUrl;
  String slug;
  String contentCreator;
  AnimationsContent(
      {required this.featuredImage,
      required this.contentCreator,
      required this.course,
      required this.curriculum,
      required this.grade,
      required this.slug,
      required this.title,
      required this.unit,
      required this.webUrl});
}

//Dummies Constants to use for.

List<AnimationsContent> animations = [
  AnimationsContent(
    featuredImage:
        'https://cdn.pixabay.com/photo/2015/07/27/20/16/book-863418_1280.jpg',
    contentCreator: 'Aime Ndayambaje',
    course: 'Mathematics',
    curriculum: 'Rwanda Curriculum',
    grade: 'D2',
    slug: 'Slug',
    title: 'The Book Title Should Go Here',
    unit: 'Chapter 1',
    webUrl: 'https://www.youtube.com/watch?v=vAOWRithkqs',
  ),
  AnimationsContent(
    featuredImage:
        'https://cdn.pixabay.com/photo/2017/02/01/13/52/kids-2030260_1280.jpg',
    contentCreator: 'Aime Ndayambaje',
    course: 'Mathematics',
    curriculum: 'Rwanda Curriculum',
    grade: 'D2',
    slug: 'Slug',
    title: 'The Book Title Should Go Here',
    unit: 'Chapter 1',
    webUrl: 'https://www.youtube.com/watch?v=vAOWRithkqs',
  ),
];
