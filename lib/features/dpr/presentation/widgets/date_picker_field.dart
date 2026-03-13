import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerField({super.key, required this.onDateSelected});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });

      widget.onDateSelected(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickDate,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: "Date",
          labelStyle: TextStyle(color: AppColors.textPrimary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
        ),
        child: Text(
          selectedDate == null
              ? "Select Date"
              : selectedDate.toString().split(" ")[0],
        ),
      ),
    );
  }
}
