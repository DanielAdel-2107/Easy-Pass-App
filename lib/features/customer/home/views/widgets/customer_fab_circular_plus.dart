import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/features/customer/home/models/fac_circular_menu_plus_model.dart';
import 'package:easy_pass/features/customer/home/views/widgets/custom_fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerFabCircularMenuPlus extends StatelessWidget {
  const CustomerFabCircularMenuPlus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFabCircularMenuPlus(
      menuItems: [
        FacCircularMenuPlusModel(
          icon: Icons.person,
          label: "Profile",
          route: RouteNames.profileScreen,
        ),
        FacCircularMenuPlusModel(
          icon: Icons.my_library_books_rounded,
          label: "My Requests",
          route: RouteNames.myRequestsScreen,
        ),
        FacCircularMenuPlusModel(
          icon: CupertinoIcons.ticket,
          label: "Show Owner Requests",
          route: RouteNames.showOwnerRequestScreen,
        ),
        FacCircularMenuPlusModel(
          icon: Icons.logout,
          label: "Logout",
          route: RouteNames.signInScreen,
        ),
      ],
    );
  }
}
