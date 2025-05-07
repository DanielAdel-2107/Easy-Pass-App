import 'dart:developer';
import 'dart:io';
import 'package:easy_pass/app/my_app.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/helper/pick_image.dart';
import 'package:easy_pass/core/network/supabase/database/add_data.dart';
import 'package:easy_pass/core/network/supabase/storage/upload_file.dart';
import 'package:easy_pass/features/customer/home/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'add_ticket_state.dart';

class AddTicketCubit extends Cubit<AddTicketState> {
  AddTicketCubit() : super(AddTicketInitial()) {
    getAllCategories();
  }
  final ticketNameController = TextEditingController();
  final ticketLocationController = TextEditingController();
  final moreDataController = TextEditingController();
  final priceController = TextEditingController();
  final ticketTypeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? file;
  // get all categories
  List<CategoryModel> categories = [];

  getAllCategories() async {
    try {
      emit(GetAllCategoryLoading());
      final response =
          await getIt<SupabaseClient>().from("categories").select().single();
      if (response != null) {
        List<dynamic> rawCategories = response["categories"];
        categories = rawCategories
            .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
        categories.sort((a, b) => a.title.compareTo(b.title));
        emit(GetAllCategorySuccess());
      } else {
        log("No categories found");
        emit(GetAllCategoryFailure(message: "No categories found"));
      }
    } catch (e) {
      log("Error fetching categories: $e");
      emit(GetAllCategoryFailure(message: e.toString()));
    }
  }

  //! pick image
  pickImage() {
    pickAndUploadImages().then(
      (value) {
        if (value != null) {
          file = value;
          emit(PickedImageSuccess());
        }
      },
    );
  }

  //! pick time
  DateTime initialDate = DateTime.now();
  TimeOfDay initialtime = TimeOfDay.now();
  String? selectedStartTime;
  String? selectedEndTime;
  String? formatSelectedDate;
  Future<void> pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: navigatorKey.currentState!.context,
      firstDate: DateTime.now(),
      initialDate: initialDate,
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      formatSelectedDate = DateFormat('dd/MM/yyyy').format(newDate);
      emit(SelectDateSuccess());
    }
  }

  Future<void> pickTime({required String timeCycle}) async {
    TimeOfDay? newTime = await showTimePicker(
      context: navigatorKey.currentState!.context,
      initialTime: initialtime,
    );
    if (newTime != null) {
      final DateTime selectedTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        newTime.hour,
        newTime.minute,
      );
      String formattedTime = DateFormat('hh:mm a').format(selectedTime);
      if (timeCycle == "From") {
        selectedStartTime = formattedTime;
      } else if (timeCycle == "To") {
        selectedEndTime = formattedTime;
      }
      emit(TimeUpdatedState());
    }
  }

  //! add ticket
  addTicket() async {
    if (moreDataController.text.isEmpty) {
      moreDataController.text = "No More Data";
    }
    if (!isEndTimeValid(selectedStartTime!, selectedEndTime!)) {
      emit(AddTicketFailure(message: "Please select availed time"));
      return;
    }
    if (formKey.currentState!.validate() &&
        ticketTypeController.text.isNotEmpty &&
        file != null &&
        selectedEndTime != null &&
        selectedStartTime != null &&
        formatSelectedDate != null) {
      try {
        emit(AddTicketLoading());
        await addData(tableName: "tickets", data: {
          "admin_id": getIt<SupabaseClient>().auth.currentUser!.id,
          "ticket_name": ticketNameController.text,
          "ticket_location": ticketLocationController.text,
          "price": priceController.text,
          "more_data": moreDataController.text,
          "ticket_type": ticketTypeController.text,
          "image": await uploadFileToSupabaseStorage(file: file!),
          "to_time": selectedEndTime,
          "from_time": selectedStartTime,
          "date": formatSelectedDate,
        });
        emit(AddTicketSuccess());
      } catch (e) {
        emit(AddTicketFailure(message: e.toString()));
      }
    } else {
      emit(AddTicketFiledsEmpty());
    }
  }

  bool isEndTimeValid(String startTime, String endTime) {
    DateFormat format = DateFormat('hh:mm a');
    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);
    return end.isAfter(start);
  }
}
