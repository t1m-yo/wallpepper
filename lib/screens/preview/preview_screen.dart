import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpepper/screens/preview/controllers/preview_controller.dart';

class PreviewScreen extends StatelessWidget {
  final String imageUrl;
  final String? title;

  const PreviewScreen({
    Key? key,
    required this.imageUrl,
    this.title
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm\nEEE,d MMM').format(now);
    return GetBuilder<PreviewController>(
        init: PreviewController(),
        builder: (previewController) {
          return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        title: title != null ? Text(title!) : const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => {
          await previewController.dowloadImage(imageUrl)
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.download_outlined, color: Colors.white,),
      ),
      body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: imageUrl,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 52,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  previewController.downloading
                      ? imageDownloadDialog() : const SizedBox.shrink()
                ],
              )
          ));
        }
      );
  }
  Widget imageDownloadDialog() {
    return Center(
      child: SizedBox(
        height: 120.0,
        width: 200.0,
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
               CircularProgressIndicator(color: Colors.white,),
               SizedBox(height: 20.0),
              Text(
                "Идет установка фона. Подождите...",
                style: TextStyle(color: Colors.white),
              )
            ],
        ),
      ),
    );
  }
}