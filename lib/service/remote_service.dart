import 'package:get/get.dart';

import '../models/category_response.dart';
import '../models/show_data_response.dart';
import '../models/show_detail.dart';
import '../resources/strings.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class Service extends GetConnect {
  final String showCategory = '${Strings.apiBaseUrl}category/get-all';
  final String deletePost = '${Strings.apiBaseUrl}post/delete-data/';

  final String showData = '${Strings.apiBaseUrl}post/get-all';
  final String showDataDetail = '${Strings.apiBaseUrl}post/show-data/';
  final String updatePost = '${Strings.apiBaseUrl}post/update-data/';

  Future postData(model) async {
    try {
      final response = await post(
          updatePost,
          headers: {
            'Accept': 'application/json',
          },
          model.toJson());

      if (response.statusCode == 200) {
        return (response.body["message"]);
      } else {
        throw (response.body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future updateData(model, String id) async {
    try {
      final response = await post(
          "$updatePost$id",
          headers: {
            'Accept': 'application/json',
          },
          model.toJson());

      if (response.statusCode == 200) {
        return (response.body["message"]);
      } else {
        throw (response.body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ShowDataResponse> getData() async {
    try {
      final response = await get(
        showData,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return ShowDataResponse.fromJson(response.body);
      } else {
        throw (response.body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await delete(
        "$deletePost$id",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return "sukses";
      } else if (response.statusCode == null) {
        throw ("Koneksi Internet Tidak Ada.");
      } else {
        throw (response.body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ShowDetail> getDataDetail(String id) async {
    try {
      final response = await get(
        "$showDataDetail$id",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return ShowDetail.fromJson(response.body);
      } else if (response.statusCode == null) {
        throw ("Koneksi Internet Tidak Ada.");
      } else {
        throw (response);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<GetCategoryResponse> dataCategory() async {
    try {
      final response = await get(
        showCategory,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return GetCategoryResponse.fromJson(response.body);
      } else if (response.statusCode == null) {
        throw ("Koneksi Internet Tidak Ada.");
      } else {
        throw (response.body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}
