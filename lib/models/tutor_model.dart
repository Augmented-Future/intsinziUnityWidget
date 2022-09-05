class Tutor {
  int id;
  String imgUrl, firstName, lastName, meetingRoom;
  double pricePerHour;
  Map<String, DateTime> timeAvailable;
  DateTime createdAt;
  DateTime updatedAt;
  Tutor(
      {required this.createdAt,
      required this.firstName,
      required this.id,
      required this.imgUrl,
      required this.lastName,
      required this.meetingRoom,
      required this.pricePerHour,
      required this.timeAvailable,
      required this.updatedAt});
}

List<Tutor> tutors = [
  Tutor(
    createdAt: DateTime.now(),
    firstName: "Mahoro",
    id: 1,
    imgUrl:
        'https://www.simplybusiness.co.uk/static/cb5f52ea6f6e13ea1dc1d0c75c2f40c1/99eae/how-to-become-a-teacher.jpg',
    lastName: 'Peace',
    meetingRoom: 'Online',
    pricePerHour: 500,
    timeAvailable: {"from": DateTime.now(), "to": DateTime.now()},
    updatedAt: DateTime.now(),
  ),
  Tutor(
    createdAt: DateTime.now(),
    firstName: "Gahamanyi",
    id: 1,
    imgUrl:
        'https://www.simplybusiness.co.uk/static/cb5f52ea6f6e13ea1dc1d0c75c2f40c1/99eae/how-to-become-a-teacher.jpg',
    lastName: 'Marcel',
    meetingRoom: 'KOICA 201',
    pricePerHour: 650,
    timeAvailable: {"from": DateTime.now(), "to": DateTime.now()},
    updatedAt: DateTime.now(),
  ),
  Tutor(
    createdAt: DateTime.now(),
    firstName: "Gahamanyi",
    id: 1,
    imgUrl:
        'https://www.simplybusiness.co.uk/static/cb5f52ea6f6e13ea1dc1d0c75c2f40c1/99eae/how-to-become-a-teacher.jpg',
    lastName: 'Marcel',
    meetingRoom: 'KOICA 201',
    pricePerHour: 650,
    timeAvailable: {"from": DateTime.now(), "to": DateTime.now()},
    updatedAt: DateTime.now(),
  ),
  Tutor(
    createdAt: DateTime.now(),
    firstName: "Gahamanyi",
    id: 1,
    imgUrl:
        'https://www.simplybusiness.co.uk/static/cb5f52ea6f6e13ea1dc1d0c75c2f40c1/99eae/how-to-become-a-teacher.jpg',
    lastName: 'Marcel',
    meetingRoom: 'KOICA 201',
    pricePerHour: 650,
    timeAvailable: {"from": DateTime.now(), "to": DateTime.now()},
    updatedAt: DateTime.now(),
  ),
];
