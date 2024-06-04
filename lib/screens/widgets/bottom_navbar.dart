import 'package:dokan/app/controllers/home_controller.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar {
  static show() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: Dimensions.bottomAppBarSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(
                    'assets/icons/home.svg',
                    0,
                    Dimensions.lgSize * 1.5,
                  ),
                  buildNavItem(
                    'assets/icons/lists.svg',
                    1,
                    Dimensions.lgSize * 1.35,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(
                    'assets/icons/cart.svg',
                    2,
                    Dimensions.lgSize * 1.35,
                  ),
                  buildNavItem(
                    'assets/icons/user.svg',
                    3,
                    Dimensions.lgSize * 1.25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return BottomNavigationBar(
    //   type: BottomNavigationBarType.fixed,
    //   showSelectedLabels: false,
    //   showUnselectedLabels: false,
    //   elevation: 10,
    //   backgroundColor: RGB.white,
    //   selectedItemColor: RGB.primary.withOpacity(0.15),
    //   currentIndex: HomeController.selectedPage.value,
    //   onTap: (int index) {
    //     HomeController.pageUpdate(index: index);
    //   },
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: SvgPicture.asset(
    //         'assets/icons/home.svg',
    //         width: Dimensions.lgSize * 1.5,
    //       ),
    //       label: '',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: SvgPicture.asset(
    //         'assets/icons/lists.svg',
    //         width: Dimensions.lgSize * 1.5,
    //       ),
    //       label: '',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: SvgPicture.asset(
    //         'assets/icons/cart.svg',
    //         width: Dimensions.lgSize * 1.5,
    //       ),
    //       label: '',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: SvgPicture.asset(
    //         'assets/icons/user.svg',
    //         width: Dimensions.lgSize * 1.5,
    //       ),
    //       label: '',
    //     ),
    //   ],
    // );
  }

  static Widget buildNavItem(String assetPath, int pageIndex, double width) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          HomeController.pageUpdate(index: pageIndex);
        },
        child: SvgPicture.asset(
          assetPath,
          width: width,
          color: HomeController.selectedPage.value == pageIndex
              ? RGB.primary
              : RGB.secondary.withOpacity(0.75),
        ),
      ),
    );
  }
}
