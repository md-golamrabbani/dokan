import 'package:dokan/app/controllers/home_controller.dart';
import 'package:dokan/screens/widgets/star_rating_widget.dart';
import 'package:dokan/utils/button.dart';
import 'package:dokan/utils/checkbox.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:dokan/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.menu),
        ),
        title: const Text(
          'Product List',
          style: TextStyles.appBarStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: Dimensions.defaultSize,
            ),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: Dimensions.defaultSize * 2,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: Dimensions.defaultSize / 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.defaultSize,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Dimensions.radiusSize,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.tinySize / 2,
                  horizontal: Dimensions.tinySize,
                ),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        filterProduct(context: context);
                      },
                      icon: const Icon(
                        Icons.tune,
                        color: RGB.muted,
                      ),
                      label: const Text(
                        'Filter',
                        style: TextStyle(
                          color: RGB.muted,
                          fontSize: Dimensions.defaultSize,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton(
                            initialValue: '0',
                            onSelected: (item) {},
                            offset: const Offset(0, Dimensions.defaultSize * 2),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusSize,
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sort by',
                                  style: TextStyle(
                                    color: RGB.muted,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: RGB.muted,
                                ),
                              ],
                            ),
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: '1',
                                child: Text('Price high to low'),
                              ),
                              const PopupMenuItem(
                                value: '2',
                                child: Text('Price low to high'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Dimensions.defaultSize * 2,
                            child: OutlinedButton(
                              clipBehavior: Clip.hardEdge,
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(
                                    Dimensions.zeroSize,
                                  ),
                                ),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide.none,
                                ),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.list,
                                color: RGB.secondary.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            final homeController = Get.find<HomeController>();
            if (!homeController.isProductLoaded.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: RGB.dark,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(
                Dimensions.defaultSize,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: homeController.prodoctList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Dimensions.defaultSize,
                  mainAxisSpacing: Dimensions.defaultSize,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = homeController.prodoctList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radiusSize,
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          height: 180,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                Dimensions.smSize,
                              ),
                              topRight: Radius.circular(
                                Dimensions.smSize,
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                Dimensions.smSize,
                              ),
                              topRight: Radius.circular(
                                Dimensions.smSize,
                              ),
                            ),
                            child: Image.asset(
                              product['image_url'],
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.tinySize,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: Dimensions.tinySize,
                              ),
                              Text(
                                product['name'].length > 20
                                    ? '${product['name'].substring(0, 20)}...'
                                    : product['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: Dimensions.defaultSize,
                                ),
                              ),
                              const SizedBox(
                                height: Dimensions.tinySize,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '\$${product['price']}',
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Dimensions.tinySize,
                                  ),
                                  Text(
                                    '\$${product['discount_price']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.lgSize,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Dimensions.tinySize,
                              ),
                              const StarRating(
                                starCount: 4,
                                color: RGB.rating,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  void filterProduct({
    required BuildContext context,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 420,
          padding: const EdgeInsets.all(
            Dimensions.defaultSize,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: Dimensions.lgSize * 3,
                        height: Dimensions.tinySize / 3,
                        margin: const EdgeInsets.symmetric(
                          vertical: Dimensions.tinySize,
                        ),
                        decoration: BoxDecoration(
                          color: RGB.pink.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(
                            Dimensions.defaultSize,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.tinySize / 3,
                        top: Dimensions.smSize / 2,
                        bottom: Dimensions.smSize / 2,
                      ),
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.lgSize,
                        ),
                      ),
                    ),
                    CheckBoxs.show(
                      onChanged: (value) {},
                      text: 'Newest',
                      value: true,
                    ),
                    CheckBoxs.show(
                      onChanged: (value) {},
                      text: 'Oldest',
                    ),
                    CheckBoxs.show(
                      onChanged: (value) {},
                      text: 'Price low > High',
                    ),
                    CheckBoxs.show(
                      onChanged: (value) {},
                      text: 'Price high > Low',
                    ),
                    CheckBoxs.show(
                      onChanged: (value) {},
                      text: 'Best selling',
                    ),
                  ],
                )),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: Button.light,
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.defaultSize,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: Button.success,
                        child: const Text('Apply'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
