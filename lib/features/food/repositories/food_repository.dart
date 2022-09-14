import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../config/constant_config.dart';
import '../../../core/network/network_info.dart';

class FoodRepository {
  Dio dio = Dio();
  ConstantConfig constantConfig = ConstantConfig();
  NetworkInfo networkInfo = NetworkInfo();

  Future<List?> getFoods() async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        Response response = await dio.get(
          '${constantConfig.baseUrl}/api/json/v1/${constantConfig.apiKey}/search.php',
          queryParameters: {
            // Karena tidak ada end point mengambil semua list Meal di api jadi saya mencari lewat end point search yang kosong
            's': '',
          },
        );
        if (response.statusCode == 200) {
          return response.data['meals'];
        } else {
          debugPrint(response.statusMessage);
          return null;
        }
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    } else {
      debugPrint('Internet No connected');
      return null;
    }
  }
}
