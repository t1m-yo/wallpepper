import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpepper/screens/home/widgets/image_card.dart';
import 'package:wallpepper/widgets/loading_overlay.dart';

import 'controllers/home_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List media = [
      'https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg',
      'https://images.pexels.com/photos/3573351/pexels-photo-3573351.png',
      'https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg',
    ];
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: LoadingOverlay(
              isLoading: homeController.isLoading,
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: CarouselSlider(
                    items: List.generate(media.length, (index) => ImageCard(imageUrl: media[index])),
                    options: CarouselOptions(
                      height: Get.height,
                      aspectRatio: 16/9,
                      viewportFraction: 0.6,
                      enableInfiniteScroll: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (context,index){},
                      scrollDirection: Axis.vertical,
                    )
                ),
              ),
            )
          );
        }
      ),
    );
  }
}