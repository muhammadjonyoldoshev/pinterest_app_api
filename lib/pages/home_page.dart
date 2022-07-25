import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:printerest_app/pages/home_controller.dart';
import 'package:printerest_app/views/h_make_images_views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: MasonryGridView.count(
            crossAxisCount: controller.crossAxisCount,
            mainAxisSpacing: 4,
            itemCount: controller.photos.length,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return HMakeImages(
                singlePhoto: controller.photos[index],
              );
            },
          ),
        );
      },
    );
  }
}
