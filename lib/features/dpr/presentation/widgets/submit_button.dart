import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_bloc.dart';
import 'package:flutter_intern_task/features/dpr/presentation/bloc/dpr_state.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DprBloc, DprState>(
      builder: (context, state) {
        if (state is DprSubmitting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: const Text(
            "Submit DPR",
            style: TextStyle(color: AppColors.textWhite),
          ),
        );
      },
    );
  }
}
