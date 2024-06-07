import 'package:dokan/utils/button.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/input.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.lgSize,
          ),
          child: Text(
            'My Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.lgSize * 1.25,
              fontWeight: FontWeight.w800,
              color: RGB.dark,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: Dimensions.defaultSize,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.circleSize,
            ),
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(
              Dimensions.circleSize,
            ),
            padding: const EdgeInsets.all(
              Dimensions.tinySize - 2,
            ),
            color: RGB.primary,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Dimensions.circleSize,
              ),
              child: Image.asset(
                'assets/images/avatar.png',
                width: Dimensions.avatarSize * 1.75,
                height: Dimensions.avatarSize * 1.75,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            Dimensions.defaultSize,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.radiusSize,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: Dimensions.tinySize,
                ),
                profileItem(
                  isSvg: true,
                  svg: 'assets/icons/user.svg',
                  text: 'Account',
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultSize,
                        vertical: Dimensions.defaultSize / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email'),
                          const SizedBox(
                            height: Dimensions.tinySize,
                          ),
                          TextFormField(
                            decoration: inputStyle(
                              hintText: 'youremail@xmail.com',
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.lgSize,
                          ),
                          const Text('Full Name'),
                          const SizedBox(
                            height: Dimensions.tinySize,
                          ),
                          TextFormField(
                            decoration: inputStyle(
                              hintText: 'William Bennett',
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.lgSize,
                          ),
                          const Text('Street Address'),
                          const SizedBox(
                            height: Dimensions.tinySize,
                          ),
                          TextFormField(
                            decoration: inputStyle(
                              hintText: '465 Nolan Causeway Suite 079',
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.lgSize,
                          ),
                          const Text('Apt, Suite, Bldg (optional)'),
                          const SizedBox(
                            height: Dimensions.tinySize,
                          ),
                          TextFormField(
                            decoration: inputStyle(
                              hintText: 'Unit 512',
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.lgSize,
                          ),
                          const Text('Zip Code'),
                          const SizedBox(
                            height: Dimensions.tinySize,
                          ),
                          SizedBox(
                            width: Get.width / 4,
                            child: TextFormField(
                              decoration: inputStyle(
                                hintText: '77017',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.lgSize,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: Button.light,
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(
                                width: Dimensions.defaultSize,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: Button.success,
                                  child: const Text('Apply'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                profileItem(
                  isSvg: true,
                  svg: 'assets/icons/password.svg',
                  text: 'Passwords',
                  children: [],
                ),
                const Divider(),
                profileItem(
                  isSvg: true,
                  svg: 'assets/icons/bell.svg',
                  text: 'Notification',
                  children: [],
                ),
                const Divider(),
                profileItem(
                  isSvg: false,
                  icon: Icons.favorite_border_outlined,
                  text: 'Whishlist (00)',
                  children: [],
                ),
                const SizedBox(
                  height: Dimensions.tinySize,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget profileItem({
    required bool isSvg,
    required String text,
    required List<Widget> children,
    String? svg,
    IconData? icon,
  }) {
    return ListTileTheme(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Dimensions.defaultSize,
      ),
      horizontalTitleGap: Dimensions.smSize,
      minLeadingWidth: 0,
      child: ExpansionTile(
        iconColor: RGB.dark,
        textColor: RGB.dark,
        shape: const Border(),
        leading: isSvg
            ? SvgPicture.asset(
                svg!,
                width: Dimensions.lgSize,
              )
            : Icon(
                icon,
                size: Dimensions.lgSize,
              ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: Dimensions.defaultSize,
          ),
        ),
        children: children,
      ),
    );
  }
}
