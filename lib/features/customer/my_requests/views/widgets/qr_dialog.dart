import 'dart:convert';

import 'package:easy_pass/features/customer/my_requests/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends StatefulWidget {
  const QRDialog({super.key, required this.requestModel});

  final RequestModel requestModel;

  @override
  State<QRDialog> createState() => _QRDialogState();
}

class _QRDialogState extends State<QRDialog> {
  bool showQR = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width * 0.04)),
      content: SizedBox(
        width: width * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              showQR ? 'Scan this code' : 'Ticket Info',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.02),
            showQR
                ? QrImageView(
                    data: jsonEncode(widget.requestModel.toJson()),
                    version: QrVersions.auto,
                    size: width * 0.5,
                    gapless: true,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Ticket Name', widget.requestModel.ticketName),
                      _buildInfoRow('User', widget.requestModel.userName),
                      _buildInfoRow('Status', widget.requestModel.status),
                      _buildInfoRow('Payed', widget.requestModel.payed.toString()),
                    ],
                  ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => setState(() => showQR = !showQR),
          child: Text(showQR ? 'Show Info' : 'Show QR'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
      child: Row(
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}