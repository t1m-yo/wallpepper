import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../preview/preview_screen.dart';



class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({Key? key,
    required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(() => PreviewScreen(imageUrl: imageUrl)),
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.fill
            )
          ),
        ),
      );
  }
}