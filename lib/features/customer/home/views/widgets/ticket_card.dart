import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;

    return GestureDetector(
      onTap: () {
        context.pushScreen(
          RouteNames.ticketDetailsScreen,
          arguments: ticketModel.toJson(),
        );
      },
      child: Card(
        color: Colors.black87,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    ticketModel.image,
                    height: screenHeight * 0.185,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: screenHeight * 0.055),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          ticketModel.ticketName,
                          style: AppTextStyles.title16White500,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Location : ${ticketModel.ticketLocation}",
                        style: AppTextStyles.title16White400,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Price : ${ticketModel.price}",
                        style: AppTextStyles.title16White400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (ticketModel.resell) ...[
              Positioned(
                top: screenHeight * 0.02,
                left: -screenWidth * 0.12,
                child: Transform.rotate(
                  angle: -0.785398,
                  child: Container(
                    width: screenWidth * 0.4,
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                    color: Colors.redAccent,
                    child: Center(
                      child:
                          Text("Resell", style: AppTextStyles.title16White500),
                    ),
                  ),
                ),
              ),
            ],
            if (ticketModel.suspended) ...[
              Positioned(
                top: screenHeight * 0.02,
                left: -screenWidth * 0.12,
                child: Transform.rotate(
                  angle: -0.785398,
                  child: Container(
                    width: screenWidth * 0.4,
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                    color: Colors.grey,
                    child: Center(
                      child: Text("Sold Out",
                          style: AppTextStyles.title16White500),
                    ),
                  ),
                ),
              ),
            ],
            Positioned(
              top: screenHeight * 0.19,
              left: -screenWidth * 0.045,
              child: CircleAvatar(
                radius: screenWidth * 0.05,
                backgroundColor: AppColors.kPrimaryColor,
              ),
            ),
            Positioned(
              top: screenHeight * 0.19,
              right: -screenWidth * 0.045,
              child: CircleAvatar(
                radius: screenWidth * 0.05,
                backgroundColor: AppColors.kPrimaryColor,
              ),
            ),
            Positioned(
              top: screenHeight * 0.216,
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        (constraints.maxWidth / 10).floor(),
                        (index) => Container(
                          width: screenWidth * 0.012,
                          height: 1.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
