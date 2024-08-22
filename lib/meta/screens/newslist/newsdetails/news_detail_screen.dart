import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/constants/constants.dart';
import 'package:newsapp/meta/widgets/custombuttons.dart';

import '../../../../app/constants/sizeConfig.dart';

class NewsDetailScreen extends StatefulWidget {
  final String? title,
      image,
      time,
      topic,
      duration,
      description,
      profilepic,
      authorname;
  const NewsDetailScreen(
      {super.key,
      this.title,
      this.image,
      this.topic,
      this.time,
      this.duration,
      this.description,
      this.profilepic,
      this.authorname});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool isReadmore = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.32,
            width: SizeConfig.screenWidth,
            child: Stack(
              children: [
                CachedNetworkImage(
                  height: SizeConfig.screenHeight! * 0.3,
                  width: SizeConfig.screenWidth,
                  imageUrl: widget.image ??
                      "https://images.unsplash.com/photo-1554469384-e58fac16e23a",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        // horizontal: SizeConfig.blockSizeHorizontal! * ,
                        top: SizeConfig.blockSizeVertical! * 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              size: SizeConfig.blockSizeHorizontal! * 7,
                              color: BConstantColors.backgroundColor,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_outline,
                                size: SizeConfig.blockSizeHorizontal! * 7,
                                color: BConstantColors.backgroundColor,
                              ))
                        ],
                      ),
                    )),
                Positioned(
                    left: SizeConfig.screenWidth! * 0.04,
                    top: SizeConfig.screenHeight! * 0.12,
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(62, 255, 255, 255),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          " Tech ",
                          style: kPopinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                              color: BConstantColors.backgroundColor),
                        ),
                      ),
                    )),
                Positioned(
                  left: SizeConfig.screenWidth! * 0.02,
                  right: SizeConfig.screenWidth! * 0.09,
                  bottom: SizeConfig.screenHeight! * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? "Title",
                          style: kPopinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: BConstantColors.backgroundColor),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 0.7,
                        ),
                        Text(
                          " ${widget.time} | ${widget.duration} ",
                          style: kPopinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                              color: BConstantColors.backgroundColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 7,
                      width: SizeConfig.blockSizeHorizontal! * 15,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 23, 10, 10),
                        image: DecorationImage(
                            image: NetworkImage("${widget.profilepic}"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.authorname ?? " Raquel Torres ",
                          style: kPopinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                              color: BConstantColors.txt1Color),
                        ),
                        Text(
                          " Editor ",
                          style: kPopinsMedium.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                              color: BConstantColors.txt2Color),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  "12 Comments ",
                  style: kPopinsMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                      color: BConstantColors.txt2Color),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              widget.description ??
                  "Since the nonprofit, which offers housing and services for people experiencing homelessness, opened the shelter at a downtown San Antonio Holiday Inn in December 2023, it has contracted with Texas Veteran Security to patrol the site.Across three shifts, 27 guards monitor the perimeter of the former hotel, at 318 W. Cesár E. Chávez Blvd. on the west side of downtown, by foot and vehicle around the clock.",
              style: kPopinsRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                  color: BConstantColors.txt1Color),
              maxLines: isReadmore ? 15 : null,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Custombutton2(
                string: isReadmore ? "Read more" : "Read less ",
                textstyle: kPopinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.3,
                    color: BConstantColors.buttontxtColor),
                voidCallback: () {
                  setState(() {
                    isReadmore = !isReadmore;
                  });
                },
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [
                Text(
                  "Related in Tech ",
                  textAlign: TextAlign.left,
                  style: kPopinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: BConstantColors.txt1Color,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 1,
          ),
          SizedBox(
            width: SizeConfig.screenWidth!,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 9,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 23, 10, 10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i0.wp.com/sanantonioreport.org/wp-content/uploads/2024/05/IMG_0177-scaled.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          "San Antonio security company tests surveillance robots from Singapore",
                          style: kPopinsSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 0.25,
                      ),
                      Text(
                        " 1 hour ago | 4 min read",
                        style: kPopinsSemiBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                            color: BConstantColors.txt2Color),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
        ]),
      )),
    );
  }
}
