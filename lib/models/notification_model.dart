class Notification {
  int id;
  String title, description;
  DateTime createdAt;
  Notification(
      {required this.createdAt,
      required this.description,
      required this.id,
      required this.title});
}

List<Notification> notifications = [
  Notification(
    createdAt: DateTime.now(),
    description:
        "Intsinzi App has released newer version, It's dope 🫅 Check it out on Google Play Store and Apple App Store is available now.",
    id: 1,
    title: "INTSINZI App has released newer version",
  ),
  Notification(
    createdAt: DateTime.now(),
    description:
        "New animation matching your grade has added Imbyino yo muri pariki y'akagera. Watch, learn and share.",
    id: 1,
    title: "Imbyino yo muri pariki y'akagera",
  ),
  Notification(
    createdAt: DateTime.now(),
    description:
        "Intsinzi App has released newer version, It's dope 🫅 Check it out on Google Play Store and Apple App Store is available now.",
    id: 1,
    title: "INTSINZI App has released newer version",
  ),
  Notification(
    createdAt: DateTime.now(),
    description:
        "New animation matching your grade has added Imbyino yo muri pariki y'akagera. Watch, learn and share.",
    id: 1,
    title: "Imbyino yo muri pariki y'akagera",
  ),
];
