import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/payment/view_models/cubit/payment_cubit.dart';
import 'package:easy_pass/features/customer/payment/views/widgets/credit_card_display.dart';
import 'package:easy_pass/features/customer/payment/views/widgets/credit_card_input_form_field.dart';
import 'package:easy_pass/features/customer/payment/views/widgets/payment_button.dart';
import 'package:easy_pass/features/customer/payment/views/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentForm extends StatefulWidget {
  final String args;
  const PaymentForm({super.key, required this.args});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => SuccessDialog(),
          );
        } else if (state is PaymentError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(context.screenWidth * 0.06), // 6% of screen width
            child: Column(
              children: [
                CreditCardDisplay(
                  animationController: _animationController,
                  scaleAnimation: _scaleAnimation,
                  cubit: context.read<PaymentCubit>(),
                ),
                SizedBox(height: context.screenHeight * 0.04), // 4% of screen height
                CreditCardInputForm(
                  formKey: _formKey,
                  cubit: context.read<PaymentCubit>(),
                ),
                SizedBox(height: context.screenHeight * 0.03), // 3% of screen height
                SizedBox(height: context.screenHeight * 0.05), // 5% of screen height
                PaymentButton(
                  isLoading: state is PaymentLoading,
                  onPressed: () => context.read<PaymentCubit>().submitPayment(widget.args, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
