import 'package:get/get.dart';
import 'package:wallpepper/models/media.dart';
import 'package:wallpepper/provider/app_provider.dart';

class HomeController extends GetxController {
  List<Media> mediaList = [];
  bool isLoading = true;
  @override
  void onInit() {
    AppProvider().getImageList(
      onSuccess: (media) {
        mediaList.addAll(media);
        isLoading = false;
        refresh();
      },
      onError: (error) {
        isLoading = false;
        refresh();
      },
    );
     print(mediaList);
    super.onInit();
  }
}