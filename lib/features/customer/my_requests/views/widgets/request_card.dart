import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/my_requests/models/request_model.dart';
import 'package:easy_pass/features/customer/my_requests/view_models/cubit/get_customer_requests_cubit.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/qr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCustomerCard extends StatefulWidget {
  const RequestCustomerCard({
    super.key,
    required this.requestModel,
    this.onPressed,
  });

  final RequestModel requestModel;
  final Function()? onPressed;

  @override
  State<RequestCustomerCard> createState() => _RequestCustomerCardState();
}

class _RequestCustomerCardState extends State<RequestCustomerCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.015),
        child: Column(
          children: [
            _buildRow('Ticket Name: ', widget.requestModel.ticketName),
            SizedBox(height: height * 0.015),
            _buildRow('Ticket Status: ', widget.requestModel.status),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  title: 'Show Details',
                  alignment: Alignment.center,
                  onPressed: widget.onPressed,
                  backgroundColor: Colors.white24,
                ),
                if (widget.requestModel.status == 'Accepted' &&
                    !widget.requestModel.payed)
                  CustomTextButton(
                    title: 'Pay Now',
                    alignment: Alignment.center,
                    onPressed: () => context.pushScreen(
                      RouteNames.paymentScreen,
                      arguments: widget.requestModel.id,
                    ),
                    backgroundColor: Colors.white24,
                  ),
                if (widget.requestModel.status == 'Accepted' &&
                    widget.requestModel.payed)
                  CustomTextButton(
                    title: 'Resell',
                    alignment: Alignment.center,
                    onPressed: () {
                      context
                          .read<GetCustomerRequestsCubit>()
                          .resellTicket(requestModel: widget.requestModel);
                    },
                    backgroundColor: Colors.white24,
                  ),
                if (widget.requestModel.payed)
                  IconButton(
                    icon: const Icon(Icons.qr_code, color: Colors.white),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) =>
                          QRDialog(requestModel: widget.requestModel),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.title20WhiteW500),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.title20WhiteW500,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
