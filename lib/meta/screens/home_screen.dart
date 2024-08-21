import 'package:flutter/material.dart';
import 'package:newsapp/meta/screens/newslist_screen.dart';

import '../../app/constants/constants.dart';
import '../../app/constants/sizeconfig.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  final Shader linearGradient1 = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        BConstantColors.txt2Color,
        BConstantColors.txt1Color,
      ]).createShader(Rect.largest);
  final Shader linearGradient2 = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        BConstantColors.buttontxtColor,
        BConstantColors.buttontxtColor,
      ]).createShader(Rect.largest);

  List topics = [
    "Business",
    "Politics",
    "Sports",
    "Tech",
    "Science",
    "Health",
    "World"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 1.5,
            ),
            SizedBox(
              height: 55,
              child: TabBar(
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  indicatorWeight: 3.5,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: BConstantColors.buttontxtColor, width: 2),
                    ),
                  ),
                  labelStyle: kPopinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 9,
                      foreground: Paint()..shader = linearGradient2),
                  unselectedLabelStyle: kPopinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      foreground: Paint()..shader = linearGradient1),
                  unselectedLabelColor:
                      const Color.fromARGB(255, 219, 219, 219),
                  controller: tabController,
                  tabs: [
                    customtext(
                      text: topics[0],
                    ),
                    customtext(
                      text: topics[1],
                    ),
                    customtext(
                      text: topics[2],
                    ),
                    customtext(
                      text: topics[3],
                    ),
                    customtext(
                      text: topics[4],
                    ),
                    customtext(
                      text: topics[5],
                    ),
                    customtext(
                      text: topics[6],
                    ),
                    // customtext(
                    //   text: "Comments",
                    // ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  NewsListScreen(),
                  NewsListScreen(),
                  NewsListScreen(),
                  NewsListScreen(),
                  NewsListScreen(),
                  NewsListScreen(),
                  NewsListScreen(),
                ],
              ),
            ),
          ]),
    );
  }

  Widget customtext({text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: kPopinsSemiBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 5),
      ),
    );
  }
}
