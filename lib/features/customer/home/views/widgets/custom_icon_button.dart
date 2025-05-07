// ignore_for_file: use_build_context_synchronously
import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.route,
    required this.label,
  });
  final IconData iconData;
  final String route;
  final String label;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(2),
      ),
      icon: Icon(iconData),
      onPressed: () async {
        iconData == Icons.logout
            ? quickAlert(
                title: "Logout",
                text: "Are you sure you want to logout?",
                type: QuickAlertType.info,
                onConfirmBtnTap: () async {
                  await getIt<CacheHelper>().removeData(key: "userRole");
                  await getIt<SupabaseClient>().auth.signOut();
                  context.pushAndRemoveUntilScreen(route);
                },
              )
            : context.pushScreen(route);
      },
    );
  }
}
