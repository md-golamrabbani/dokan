import 'package:dokan/screens/widgets/cart_widget.dart';
import 'package:dokan/screens/widgets/home_widget.dart';
import 'package:dokan/screens/widgets/product_widget.dart';
import 'package:dokan/screens/widgets/profile_widget.dart';

class HomeComponents {
  static List list = [
    const HomeWidget(),
    const ProductWidget(),
    const CartWidget(),
    const ProfileWidget(),
  ];
}
