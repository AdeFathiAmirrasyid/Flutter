import 'package:get/get.dart';

import '../models/detail_surah_model.dart';

class DetailSurahProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DetailSurah.fromJson(map);
      if (map is List) {
        return map.map((item) => DetailSurah.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<DetailSurah?> getDetailSurah(int id) async {
    final response = await get('detailsurah/$id');
    return response.body;
  }

  Future<Response<DetailSurah>> postDetailSurah(
          DetailSurah detailsurah) async =>
      await post('detailsurah', detailsurah);
  Future<Response> deleteDetailSurah(int id) async =>
      await delete('detailsurah/$id');
}
