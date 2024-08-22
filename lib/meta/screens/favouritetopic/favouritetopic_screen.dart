import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/constants/constants.dart';
import 'package:newsapp/meta/screens/Navbar_main_screen.dart';
import 'package:newsapp/meta/widgets/custombuttons.dart';
import '../../../app/constants/sizeconfig.dart';

class FavouriteTopicScreen extends StatefulWidget {
  const FavouriteTopicScreen({super.key});

  @override
  State<FavouriteTopicScreen> createState() => _FavouriteTopicScreenState();
}

class _FavouriteTopicScreenState extends State<FavouriteTopicScreen> {
  final List<bool> _selected = List.generate(7, (_) => false);

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
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              height: SizeConfig.screenHeight! * 0.35,
              width: SizeConfig.screenWidth,
              imageUrl:
                  "https://images.unsplash.com/photo-1554469384-e58fac16e23a",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Text(
                    "Choose your favourite topics",
                    style: kPopinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 9,
                        height: 1,
                        wordSpacing: 0.5),
                    //  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 0.9,
                  ),
                  Text(
                    "Don't worry, you can always change your preference later in the settings",
                    style: kPopinsMedium.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: BConstantColors.txt2Color,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 1,
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: SizeConfig.blockSizeHorizontal! * 4,
              runSpacing: SizeConfig.blockSizeVertical! * 2,
              children: List<Widget>.generate(topics.length, (int index) {
                return ChoiceChip(
                  autofocus: true,
                  side: const BorderSide(style: BorderStyle.none),
                  label: Text(
                    _selected[index] ? topics[index] : "— ${topics[index]}",
                    style: kPopinsSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4.9,
                        color: _selected[index]
                            ? BConstantColors.buttontxtColor
                            : BConstantColors.txt1Color),
                  ),
                  selected: _selected[index],
                  onSelected: (bool selected) {
                    _selected[index] = selected;
                    setState(() {});
                  },
                  checkmarkColor: BConstantColors.buttontxtColor,
                );
              }),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 10,
            ),
            Custombutton1(
              height: SizeConfig.screenHeight! * 0.08,
              width: SizeConfig.screenWidth!,
              string: "Save and Continue",
              textstyle: kPopinsSemiBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 5,
                  color: BConstantColors.buttontxtColor),
              voidCallback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Custombutton2(
                string: "Skip",
                textstyle: kPopinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 5,
                    color: BConstantColors.txt2Color),
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                textAlign: TextAlign.center),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
          ],
        ),
      ),
    );
  }
}
