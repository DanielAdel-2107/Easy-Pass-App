import 'package:easy_pass/features/customer/payment/view_models/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardInputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PaymentCubit cubit;

  const CreditCardInputForm({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  InputDecoration _buildInputDecoration(BuildContext context, String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015), // 1.5% of screen height
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // User input text color
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      child: CreditCardForm(
        formKey: formKey,
        obscureCvv: true,
        obscureNumber: false,
        cardNumber: cubit.cardNumber,
        cvvCode: cubit.cvv,
        cardHolderName: cubit.cardHolder,
        expiryDate: cubit.expiryDate,
        isHolderNameVisible: true,
        isCardNumberVisible: true,
        isExpiryDateVisible: true,
        onCreditCardModelChange: (model) {
          cubit.updateCard(
            number: model.cardNumber,
            holder: model.cardHolderName,
            expiry: model.expiryDate,
            cvvCode: model.cvvCode,
            isCvv: model.isCvvFocused,
          );
        },
        inputConfiguration: InputConfiguration(
          cardNumberDecoration:
              _buildInputDecoration(context, 'Card Number', 'XXXX XXXX XXXX XXXX'),
          expiryDateDecoration: _buildInputDecoration(context, 'Expiry Date', 'MM/YY'),
          cvvCodeDecoration: _buildInputDecoration(context, 'CVV', 'XXX'),
          cardHolderDecoration: _buildInputDecoration(context, 'Cardholder Name', 'Full Name'),
        ),
      ),
    );
  }
}