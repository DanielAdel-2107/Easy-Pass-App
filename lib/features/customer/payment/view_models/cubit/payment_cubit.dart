import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  final SupabaseClient supabase = Supabase.instance.client;

  String cardNumber = '';
  String cardHolder = '';
  String expiryDate = '';
  String cvv = '';
  bool isCvvFocused = false;

  void updateCard({
    required String number,
    required String holder,
    required String expiry,
    required String cvvCode,
    required bool isCvv,
  }) {
    cardNumber = number;
    cardHolder = holder;
    expiryDate = expiry;
    cvv = cvvCode;
    isCvvFocused = isCvv;
    emit(PaymentUpdated());
  }

  bool validateForm() {
    if (!cardNumber.replaceAll(' ', '').contains(RegExp(r'^\d{16}$'))) {
      emit(PaymentError('Card number must be 16 digits'));
      return false;
    }
    if (cardHolder.trim().isEmpty) {
      emit(PaymentError('Cardholder name is required'));
      return false;
    }
    if (!expiryDate.contains(RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$'))) {
      emit(PaymentError('Invalid expiry date (MM/YY)'));
      return false;
    }
    if (!cvv.contains(RegExp(r'^\d{3}$'))) {
      emit(PaymentError('CVV must be 3 digits'));
      return false;
    }
    return true;
  }

  Future<void> submitPayment(String id, BuildContext context) async {
    emit(PaymentLoading());
    if (!validateForm()) {
      return;
    }

    try {
      await supabase.from('requests').update({'payed': true}).eq('id', id);
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentError('Error: ${e.toString()}'));
    }
  }
}
