import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/utilies/assets/lotties/app_lotties.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/models/on_boarding_data.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/views/widgets/bottom_controllers.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/views/widgets/on_boarding_page.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/views/widgets/top_background.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<OnBoardingData> pages = [
    OnBoardingData(
      title: "Welcome to Easy Pass!",
      description:
          "A seamless way to buy and sell tickets for various experiences—all in one place.",
      image: AppLotties.welcomeLottie,
    ),
     OnBoardingData(
      title: "Discover & Book Instantly",
      description:
          "Browse available tickets, make quick purchases, and enjoy a hassle-free experience.",
      image: AppLotties.discoverLottie,
    ),
     OnBoardingData(
      title: "Sell & Manage Effortlessly",
      description:
          "List your tickets, reach more customers, and grow your business with ease.",
      image: AppLotties.sellLottie,
    ),
     OnBoardingData(
      title: "Join & Explore Today!",
      description:
          "Sign up now to start buying or selling tickets with just a few taps.",
      image: AppLotties.getStartedLottie,
    ),
  ];

  void _onNextPressed() {
    if (currentIndex == pages.length - 1) {
      context.pushReplacementScreen(RouteNames.signInScreen);
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TopBackground(),
          PageView.builder(
            controller: controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              final page = pages[index];
              return OnBoardingPage(data: page);
            },
          ),
          BottomControls(
            controller: controller,
            currentIndex: currentIndex,
            totalPages: pages.length,
            onNext: _onNextPressed,
          ),
          Positioned(
            right: 5,
            child: CustomTextButton(
              title: "Skip",
              onPressed: () =>
                  context.pushReplacementScreen(RouteNames.signInScreen),
            ),
          ),
        ],
      ),
    );
  }
}
