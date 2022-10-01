import 'package:http/http.dart' as http;

import 'package:dwi_selo_girimas/service/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';
import '../models/post_request_model.dart';
import '../resources/theme.dart';
import '../widget/snackbar_widget.dart';

class HomeController extends GetxController {
  final title = TextEditingController().obs;
  final slug = TextEditingController().obs;
  final image = TextEditingController().obs;
  final imagePath = "".obs;
  final idData = "".obs;
  RxBool isEdit = false.obs;

  final category_id = TextEditingController().obs;
  RxString categoryName = "".obs;

  final description = TextEditingController().obs;
  final Service _service = Get.put(Service());

  var data = [];
  var dataCategory = [];
  var dataDetail = [];

  Future showData() async {
    try {
      final response = await _service.getData();

      data = response.data;

      return data;
    } catch (e) {
      if (e == "Koneksi Internet Tidak Ada.") {
        Get.defaultDialog(
            middleText: e.toString(),
            textConfirm: 'OK',
            buttonColor: MyColors.redColor,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      } else {
        // showSnackbar("Gagal", e.toString(), MyColors.redColor);
      }
    }
  }

  Future<void> showCategory() async {
    try {
      final response = await _service.dataCategory();

      dataCategory = response.data;
      categoryName.value = response.data.first.name;
      category_id.value.text = response.data.first.id.toString();
    } catch (e) {
      if (e == "Koneksi Internet Tidak Ada.") {
        Get.defaultDialog(
            middleText: e.toString(),
            textConfirm: 'OK',
            buttonColor: MyColors.redColor,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      } else {
        // showSnackbar("Gagal", e.toString(), MyColors.redColor);
      }
    }
  }

  Future<void> showDetailDataPost(String id) async {
    try {
      final response = await _service.getDataDetail(id);

      dataDetail = [response.data];

      showDetailData(Get.context!);
    } catch (e) {
      if (e == "Koneksi Internet Tidak Ada.") {
        Get.defaultDialog(
            middleText: e.toString(),
            textConfirm: 'OK',
            buttonColor: MyColors.redColor,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      } else {
        // showSnackbar("Gagal", e.toString(), MyColors.redColor);
      }
    }
  }

  Future<void> delete(String id) async {
    try {
      final response = await _service.deleteData(id);
      showData().then((value) => Get.to(() => HomePage()));

      showSnackbar("Berhasil", "Data berhasil di simpan", MyColors.greenColor);
    } catch (e) {
      showSnackbar("Gagal", e.toString(), MyColors.redColor);
    }
  }

  Future updateData(String id) async {
    try {
      final response = await _service.updateData(
          PostRequestModel(
              categoryId: category_id.value.text,
              description: description.value.text,
              slug: title.value.text,
              title: title.value.text),
          id);
      showData();
      showSnackbar("Berhasil", "Data berhasil di simpan", MyColors.greenColor);
      Get.to(() => HomePage());
    } catch (e) {
      return showSnackbar("Gagal", e.toString(), MyColors.redColor);
    }
  }

  Future submitPost() async {
    var url =
        Uri.parse('https://api.tes-flutter.griyadepo.com/api/post/post-data');
    var req = http.MultipartRequest('POST', url)
      ..fields['title'] = title.value.text
      ..fields['slug'] = title.value.text
      ..files.add(await http.MultipartFile.fromPath('image', imagePath.value))
      ..fields['category_id'] = category_id.value.text
      ..fields['description'] = description.value.text;
    req.headers['Accept'] = 'application/json';
    try {
      var res = await req.send();

      showSnackbar("Berhasil", "Data berhasil di simpan", MyColors.greenColor);
      showData().then((value) => Get.to(() => HomePage()));
    } catch (e) {
      return showSnackbar("Gagal", e.toString(), MyColors.redColor);
    }
  }

  Future<dynamic> categoryShow(BuildContext context) {
    return Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Pilih Category",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dataCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: MyColors.backgroundColor,
                child: ListTile(
                  title: Text(dataCategory[index].name),
                  onTap: () {
                    category_id.value.text = dataCategory[index].id.toString();
                    categoryName.value = dataCategory[index].name;
                    Get.back();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  Future<dynamic> showDetailData(
    BuildContext context,
  ) async {
    return Get.bottomSheet(
      Container(
          height: 550,
          decoration: const BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Title : ${dataDetail[0].title}",
                style: MyTextStyles.headline2,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Image : ${dataDetail[0].image}",
                style: MyTextStyles.headline2,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Category : ${dataDetail[0].getCategory.name}",
                style: MyTextStyles.headline2,
              ),
            ],
          )),
    );
  }
}
