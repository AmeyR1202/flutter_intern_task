import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSection extends StatefulWidget {
  final List<XFile> images;

  const ImagePickerSection({super.key, required this.images});

  @override
  State<ImagePickerSection> createState() => _ImagePickerSectionState();
}

class _ImagePickerSectionState extends State<ImagePickerSection> {
  final picker = ImagePicker();

  Future<void> pickImage() async {
    if (widget.images.length >= 3) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Maximum 3 images allowed")));
      return;
    }

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        widget.images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: pickImage,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: const Text(
            "Upload Photo",
            style: TextStyle(color: AppColors.textWhite),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: widget.images
              .map(
                (img) => Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.file(
                    File(img.path),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
