import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/payment/view_models/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardDisplay extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> scaleAnimation;
  final PaymentCubit cubit;

  const CreditCardDisplay({
    super.key,
    required this.animationController,
    required this.scaleAnimation,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animationController.forward().then((_) => animationController.reverse());
      },
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Transform.scale(
          scale: 1.2,
          child: CreditCardWidget(
            cardNumber: cubit.cardNumber,
            expiryDate: cubit.expiryDate,
            cardHolderName: cubit.cardHolder,
            cvvCode: cubit.cvv,
            showBackView: cubit.isCvvFocused,
            onCreditCardWidgetChange: (_) {},
            cardBgColor: Colors.transparent,
            glassmorphismConfig: Glassmorphism(
              blurX: 0,
              blurY: 0,
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            isHolderNameVisible: true,
            cardType: CardType.otherBrand,
            padding: context.screenWidth * 0.05,
            animationDuration: const Duration(milliseconds: 400),
          ),
        ),
      ),
    );
  }
}