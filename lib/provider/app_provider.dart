import 'package:wallpepper/library/api_request.dart';
import 'package:wallpepper/models/media.dart';

class AppProvider {
  void getImageList({
    Function()? beforeSend,
    Function(List<Media> mediaList)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    print('Request joined');
    ApiRequest(endpoint: 'https://api.pexels.com/v1/curated',data:  {
      'page': 2, 'per_page': 5
    }).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!((data as List).map((mediaJson) => Media.fromJson(mediaJson)).toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}