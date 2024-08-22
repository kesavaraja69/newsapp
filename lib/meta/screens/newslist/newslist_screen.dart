import 'package:flutter/material.dart';
import 'package:newsapp/app/constants/constants.dart';
import 'package:newsapp/meta/screens/newslist/newsdetails/news_detail_screen.dart';

import '../../../app/constants/sizeconfig.dart';
import '../../../core/api/newslist_data.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BConstantColors.homebgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Expanded(
            child: ListView.builder(
                itemCount: topics_with_details.length,
                itemBuilder: (c, index) {
                  return customnewitem(
                    duration: topics_with_details[index]['read_time'],
                    title: topics_with_details[index]['title'],
                    time: topics_with_details[index]['time'],
                    image: topics_with_details[index]['topic_image'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(
                            title: topics_with_details[index]['title'],
                            duration: topics_with_details[index]['read_time'],
                            time: topics_with_details[index]['time'],
                            image: topics_with_details[index]['topic_image'],
                            description: topics_with_details[index]
                                ['description'],
                            authorname: topics_with_details[index]
                                ['editor name'],
                            profilepic: topics_with_details[index]
                                ['editor profile'],
                          ),
                        ),
                      );
                    },
                  );
                })),
      ),
    );
  }

  Widget customnewitem({title, image, time, duration, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          height: SizeConfig.screenHeight! * 0.37,
          width: SizeConfig.screenWidth,
          decoration: const BoxDecoration(
            color: BConstantColors.backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 20,
                    width: SizeConfig.blockSizeHorizontal! * 83,
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: kPopinsSemiBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  maxLines: 2,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " $time | $duration ",
                      style: kPopinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          color: BConstantColors.txt2Color),
                      maxLines: 2,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_outline))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
