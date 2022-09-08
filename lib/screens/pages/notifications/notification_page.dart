import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/models/notification_model.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';

import '../../../shared/funcs.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BackButtonWidget(),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0.0,
        centerTitle: false,
        actions: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: const [
                    Text("ACTIONS"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              PopupMenuButton(
                icon: const Text(
                  "ACTIONS",
                  style: TextStyle(color: Colors.transparent),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tooltip: "Show Actions",
                onSelected: (selected) {},
                color: primaryColor,
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "MARK ALL AS READ",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "CLEAR ALL",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: ((context, index) {
            DateTime date = notifications[index].createdAt;
            late int hour;
            late String mode;
            if (date.hour >= 12) {
              hour = date.hour - 12;
              mode = "PM";
            } else {
              hour = date.hour;
              mode = "AM";
            }
            String strDate =
                "${date.day} - ${months[date.day + 1]} - ${date.year}, $hour:${date.minute} $mode";
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: grayColor200,
                    offset: Offset(3, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFFF9CBD),
                    foregroundColor: Color(0xFF9F1239),
                    child: Icon(
                      Icons.volume_up_outlined,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notifications[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(notifications[index].description),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/time_clock.svg'),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                strDate,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        height: 150,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              leading: SvgPicture.asset(
                                  'assets/icons/mark_as_read.svg'),
                              title: const Text(
                                "Mark As Read",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading:
                                  SvgPicture.asset('assets/icons/trash.svg'),
                              title: const Text(
                                "Delete Notification",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
