import 'package:flutter_main/app/data/models/surah_model.dart';
import 'package:get/get.dart';



class SurahProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SurahModel.fromJson(map);
      if (map is List) return map.map((item) => SurahModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<SurahModel?> getSurah(int id) async {
    final response = await get('surah/$id');
    return response.body;
  }

  Future<Response<SurahModel>> postSurah(SurahModel surah) async =>
      await post('surah', surah);
  Future<Response> deleteSurah(int id) async => await delete('surah/$id');
}
