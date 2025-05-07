import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/decorative_edge.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/info_row.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/time_details.dart';
import 'package:flutter/material.dart';

class TicketDetailsCard extends StatelessWidget {
  const TicketDetailsCard({super.key, required this.ticket});
  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  ticket.image,
                  height: context.screenHeight * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.09,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(title: "Location", value: ticket.ticketLocation),
                    InfoRow(title: "Price", value: ticket.price),
                    InfoRow(title: "More Data", value: ticket.moreData),
                    InfoRow(title: "Date", value: ticket.date),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimeDetails(title: "From", value: ticket.fromTime),
                        Icon(Icons.change_circle, color: Colors.white),
                        TimeDetails(title: "To", value: ticket.toTime),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          DecorativeEdges(),
        ],
      ),
    );
  }
}
