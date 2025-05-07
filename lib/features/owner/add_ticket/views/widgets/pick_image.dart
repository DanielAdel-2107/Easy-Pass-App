import 'package:easy_pass/core/components/custom_icon_button_with_background.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/owner/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTicketCubit, AddTicketState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.07),
            child: Stack(
              children: [
                Container(
                  height: context.screenHeight * 0.3,
                  width: double.infinity,
                  decoration: context.read<AddTicketCubit>().file != null
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade500,
                          image: DecorationImage(
                            image:
                                FileImage(context.read<AddTicketCubit>().file!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade500,
                        ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CustomIconButtonWithBackground(
                    icon: Icons.upload,
                    iconColor: Colors.white,
                    backgroundColor: Colors.black54,
                    onPressed: () {
                      context.read<AddTicketCubit>().pickImage();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
