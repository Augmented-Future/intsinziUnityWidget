import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globaltrailblazersapp/models/tutor_model.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/filter_widget/filter_category_widget.dart';

import '../../../shared/colors.dart';
import '../../../shared/funcs.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  State<TutorsPage> createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight(context) / 4.6,
            backgroundColor: whiteColor,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: brandYellowColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/tutor_girl.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF193059).withOpacity(0.3),
                  ),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(colors: <Color>[
                        Color(0xFFFEB326),
                        Color(0xFFF0F0F0),
                        Color(0xFFFEB326)
                      ]).createShader(rect);
                    },
                    child: const Text(
                      "Get an appointment with best tutor around",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: FilterCategoryWidget(pageId: 7, courseId: 1),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        tutors[index].imgUrl,
                        width: screenWidth(context) * 0.23,
                        height: screenWidth(context) * 0.23,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${tutors[index].firstName} ${tutors[index].lastName}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: const [
                              Text("Reviews  "),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFEB35),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFEB35),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFEB35),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFEB35),
                              ),
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFEB35),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.personal_injury, size: 15),
                              Expanded(
                                child: Text(" Available: Mon - Fri 8AM - 5PM"),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.door_sliding, size: 15),
                              Text(" Online"),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/currency.svg',
                                  height: 15),
                              Text(
                                  " Price \$${tutors[index].pricePerHour.round()} /Hour"),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.book,
                              color: primaryColor,
                              size: 20,
                            ),
                            label: const Text(
                              "Book Appointment",
                              style: TextStyle(color: primaryColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: filterYellow,
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: const StadiumBorder()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: tutors.length),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
