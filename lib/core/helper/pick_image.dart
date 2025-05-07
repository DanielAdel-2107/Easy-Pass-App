// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:easy_pass/core/helper/show_snack_bar.dart';
import 'package:file_picker/file_picker.dart';

Future<File?> pickAndUploadImages() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result == null) {
      showSnackBar(title: "No image selected");
      return null;
    }
    File file = File(result.paths.first!);
    showSnackBar(title: "Image Upload Successfully");
    return file;
  } catch (e) {
    showSnackBar(title: "Unexpected error: Please try again");
    return null;
  }
}
