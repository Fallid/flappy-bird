import 'package:flappy_bird/app/components/style/color_local.dart';
import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/bindings/leader_board_easy_binding.dart';
import 'package:flappy_bird/app/modules/controllers/leader_board_easy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LeaderBoardEasyView extends GetView<LeaderBoardEasyController> {
  const LeaderBoardEasyView({super.key});

  @override
  Widget build(BuildContext context) {
    LeaderBoardEasyBinding().dependencies();
    controller.getData();
    return Sizer(builder: (context, orientation, devicetype) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorLocal.backgroundColor,
          title: const Text('Leader Board Easy Mode'),
        ),
        backgroundColor: ColorLocal.backgroundColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageLocal.backgroundPage),
              fit: BoxFit.cover,
            ),
          ),
          child: Obx(
            () => controller.dataList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = controller.dataList[index];
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${index + 1}. '),
                            SizedBox(
                              width: 1.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ${data['name']}'),
                                Text('High Score : ${data['high score easy']}')
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ),
      );
    });
  }
}
