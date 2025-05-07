import 'package:easy_pass/features/customer/home/models/fac_circular_menu_plus_model.dart';
import 'package:easy_pass/features/customer/home/views/widgets/custom_icon_button.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';

class CustomFabCircularMenuPlus extends StatelessWidget {
  const CustomFabCircularMenuPlus({
    super.key,
    required this.menuItems,
  });

  final List<FacCircularMenuPlusModel> menuItems;

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
      fabColor: Colors.black45,
      ringColor: Colors.black54,
      fabOpenIcon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      fabCloseIcon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      fabSize: 56.0,
      children: <Widget>[
        ...menuItems.map(
          (e) => CustomIconButton(
            iconData: e.icon,
            route: e.route,
            label: e.label,
          ),
        ),
      ],
    );
  }
}
