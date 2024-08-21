import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/meta/screens/favouritetopic/favouritetopic_screen.dart';
import 'package:newsapp/meta/screens/home/home_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../app/constants/constants.dart';
import '../../app/constants/sizeConfig.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
  }

  List<IconData> data = [
    Icons.home,
    Icons.search,
    Icons.bookmark,
    CupertinoIcons.person
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News",
                    style: kPopinsSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 9,
                        height: 1,
                        wordSpacing: 0.5),
                  ),
                  const Icon(
                    CupertinoIcons.line_horizontal_3_decrease,
                    size: 34,
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  Center(
                    child: HomeScreen(),
                  ),
                  Center(
                    child: HomeScreen(),
                  ),
                  Center(
                    child: HomeScreen(),
                  ),
                  Center(
                    child: HomeScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          height: 75,
          child: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomAppItembar(context, icon: Icons.home_filled, page: 0),
                _bottomAppItembar(context, icon: Icons.search, page: 1),
                _bottomAppItembar(context,
                    icon: Icons.bookmark_border_outlined, page: 2),
                _bottomAppItembar(context,
                    icon: Icons.person_2_outlined, page: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppItembar(BuildContext context, {icon, onPressed, page}) {
    return ZoomTapAnimation(
      onTap: () {
        setState(() {
          _selectedIndex = page;
        });
        pageController.jumpToPage(
          _selectedIndex,
        );
      },
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: SizeConfig.blockSizeHorizontal! * 7.5,
          color: _selectedIndex == page
              ? BConstantColors.buttontxtColor
              : BConstantColors.txt2Color,
        ),
      ),
    );
  }
}
