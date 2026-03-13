import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';

class WeatherDropdown extends StatelessWidget {
  final Function(String?) onChanged;

  const WeatherDropdown({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Weather",
        labelStyle: TextStyle(color: AppColors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),

      items: const [
        DropdownMenuItem(value: "Sunny", child: Text("Sunny")),
        DropdownMenuItem(value: "Cloudy", child: Text("Cloudy")),
        DropdownMenuItem(value: "Rainy", child: Text("Rainy")),
        DropdownMenuItem(value: "Windy", child: Text("Windy")),
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return "Select weather";
        }
        return null;
      },
    );
  }
}
