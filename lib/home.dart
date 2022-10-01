import 'package:dwi_selo_girimas/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'add_post.dart';
import 'resources/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        title: const Text(
          'List Data',
          style: MyTextStyles.headline1,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
            child: Container(
              color: MyColors.containerColor1,
              child: const Center(
                child: Text(
                  "Silahkan slide kanan dan kiri",
                  style: MyTextStyles.headline1,
                ),
              ),
            ),
          ),
          showList(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primaryColor,
        onPressed: () {
          Get.to(() => const AddPos());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  SizedBox showList(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: _home.data.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              closeThreshold: 0.1,
              motion: const ScrollMotion(),
              dragDismissible: true,
              dismissible: DismissiblePane(
                closeOnCancel: true,
                motion: const ScrollMotion(),
                confirmDismiss: () async {
                  _home.delete(_home.data[index].id.toString());
                  return true;
                },
                onDismissed: () {},
              ),
              children: [
                SlidableAction(
                  autoClose: true,
                  borderRadius: BorderRadius.circular(5),
                  onPressed: (_) {
                    _home.delete(_home.data[index].id.toString());
                    return;
                  },
                  backgroundColor: MyColors.redColor,
                  foregroundColor: MyColors.primaryColor,
                  icon: Icons.delete,
                  label: "hapus",
                ),
              ],
            ),
            endActionPane: ActionPane(
              closeThreshold: 0.1,
              motion: const ScrollMotion(),
              dragDismissible: true,
              children: [
                CustomSlidableAction(
                  onPressed: (_) {
                    _home.showDetailDataPost(_home.data[index].id.toString());
                  },
                  backgroundColor: MyColors.redColor,
                  child: Text(
                    "Show",
                    style: MyTextStyles.subtitle1
                        .copyWith(color: MyColors.primaryColor, fontSize: 12),
                  ),
                ),
                CustomSlidableAction(
                  onPressed: (_) {
                    _home.isEdit.value = true;
                    _home.title.value.text = _home.data[index].title;
                    _home.description.value.text =
                        _home.data[index].description;
                    _home.categoryName.value =
                        _home.data[index].getCategory.name;
                    _home.idData.value = _home.data[index].id.toString();
                    _home.category_id.value.text =
                        _home.data[index].categoryId.toString();
                    Get.to(() => const AddPos());
                  },
                  backgroundColor: MyColors.yellowColor,
                  child: Text(
                    "Update",
                    style: MyTextStyles.subtitle1
                        .copyWith(color: MyColors.primaryColor, fontSize: 12),
                  ),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                // addData(
                //     context, _home.dataHabit3Firestore[index].keys.toString());
              },
              child: Card(
                color: MyColors.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: ListTile(
                  title: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.title),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              _home.data[index].title.toString(),
                              textAlign: TextAlign.left,
                              maxLines: 3,
                              style: MyTextStyles.body1
                                  .copyWith(color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.description),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              _home.data[index].description,
                              textAlign: TextAlign.left,
                              style: MyTextStyles.body1
                                  .copyWith(color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
