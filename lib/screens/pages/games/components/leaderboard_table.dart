import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import '../../../../models/leaderboard.dart';

class LeaderboardTable extends StatefulWidget {
  const LeaderboardTable({Key? key}) : super(key: key);

  @override
  State<LeaderboardTable> createState() => _LeaderboardTableState();
}

class _LeaderboardTableState extends State<LeaderboardTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Table(
        children: [
          buildHeader(["Profile", "Name", "School", "Points"]),
          buildRow(
            Leaderboard(
                rank: 2,
                avatar: "avatar",
                name: "Aime Ndayambaje",
                school: "Remera Catholique",
                points: 23.8),
          ),
          buildRow(
            Leaderboard(
                rank: 2,
                avatar: "avatar",
                name: "Lewis Capaldi",
                school: "G.S. Rambura Garçon",
                points: 23.8),
          ),
        ],
      ),
    );
  }

  TableRow buildHeader(List<String> cells) => TableRow(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
          ),
        ),
        children: cells.map((cell) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Center(
                child: Text(
              cell,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
          );
        }).toList(),
      );
  TableRow buildRow(Leaderboard row) => TableRow(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
          ),
        ),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: brandYellowColor,
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/06/06/17/05/woman-1439909_1280.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              row.name,
              textAlign: TextAlign.center,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              row.school,
              textAlign: TextAlign.center,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("${row.points}"),
            ),
          ),
        ],
      );
}
