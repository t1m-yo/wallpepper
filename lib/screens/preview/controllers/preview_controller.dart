import 'package:get/get.dart';
import 'package:wallpaper/wallpaper.dart';

class PreviewController extends GetxController{
  String res = '';
  bool downloading = false;
  bool _isDisable = true;
  late Stream<String> progressString;




  Future<void> dowloadImage(String imageUrl) async {
    progressString = Wallpaper.imageDownloadProgress(imageUrl);
    progressString.listen((data) {
        res = data;
        downloading = true;
        update();
    }, onDone: () async {
        downloading = false;
        _isDisable = false;
        Wallpaper.homeScreen();
        Wallpaper.lockScreen();
        update();
    }, onError: (error) {
        downloading = false;
        _isDisable = true;
        update();
    });
  }
}