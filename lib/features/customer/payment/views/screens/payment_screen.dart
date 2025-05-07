import 'package:easy_pass/features/customer/payment/view_models/cubit/payment_cubit.dart';
import 'package:easy_pass/features/customer/payment/views/widgets/payment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (_) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: PaymentForm(args: args),
      ),
    );
  }
}





