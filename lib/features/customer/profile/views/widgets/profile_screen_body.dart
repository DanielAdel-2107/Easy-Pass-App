import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/triple_bottom_wave_painter.dart';
import 'package:easy_pass/features/customer/profile/views/widgets/profile_details.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getIt<CacheHelper>().getUserModel();
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.25,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
          ),
        ),
        ProfileDetails(user: user),
      ],
    );
  }
}
