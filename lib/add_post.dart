import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'controller/home_controller.dart';
import 'resources/theme.dart';
import 'widget/button_template.dart';
import 'widget/text_form_template.dart';

class AddPos extends StatefulWidget {
  const AddPos({super.key});

  @override
  State<AddPos> createState() => _AddPosState();
}

class _AddPosState extends State<AddPos> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final HomeController _home = Get.put(HomeController());
  File? images;
  Future getImage(ImageSource media) async {
    final ImagePicker picker = ImagePicker();
    var img = await picker.pickImage(source: media);

    setState(() {
      images = File(img!.path);
    });

    _home.image.value.text = img!.name;
    _home.imagePath.value = img.path;
  }

  void myAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MyColors.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Obx(
          (() => Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        _home.isEdit.isTrue ? 'Edit' : "Tambah Data",
                        style: MyTextStyles.body1.copyWith(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: TextFormTemplate(
                          label: "Title",
                          controller: _home.title.value,
                          typeKeyboard: TextInputType.number),
                    ),
                    if (_home.isEdit.isFalse)
                      Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, right: 16),
                              child: images?.path == null
                                  ? GestureDetector(
                                      onTap: () {
                                        // print(_home.image.value.text);
                                        // print(_home.images?.value.path);
                                        myAlert(context);
                                      },
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          radius: 100,
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        images!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: InkWell(
                        onTap: () {
                          _home.categoryShow(context);
                        },
                        child: FormField<String>(
                          validator: (value) {
                            value = _home.categoryName.value;
                            if (value.isEmpty) {
                              return "Category tidak boleh kosong";
                            }
                            return null;
                          },
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                fillColor: MyColors.backgroundColor,
                                label: const Text("Category"),
                                errorText: state.errorText,
                                errorStyle: const TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: Obx(
                                () => Text(
                                  _home.categoryName.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: TextFormTemplate(
                          label: "Description",
                          controller: _home.description.value,
                          typeKeyboard: TextInputType.number),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // if (_home.isEdit.value)
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 50,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: MyColors.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: ButtonWidget(
                            colorText: MyColors.primaryColor,
                            buttonText: "Batal",
                            color: MyColors.backgroundColor,
                            onPressed: () {
                              // _home.resetEdit();
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 50,
                          child: ButtonWidget(
                            buttonText: "Simpan",
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                if (_home.isEdit.isTrue) {
                                  _home.updateData(_home.idData.value);
                                } else {
                                  _home.submitPost();
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
