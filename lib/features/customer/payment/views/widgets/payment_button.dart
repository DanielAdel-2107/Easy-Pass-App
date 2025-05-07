import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const PaymentButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator(color: Colors.white)
        : CustomElevatedButton(
            onPressed: onPressed,
            name: 'Pay',
          );
  }
}