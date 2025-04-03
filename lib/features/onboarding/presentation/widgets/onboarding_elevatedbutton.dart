import 'package:flutter/material.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/colors.dart';

class OnboardingElevatedButton extends StatelessWidget {
  const OnboardingElevatedButton({
    super.key,
    required this.title,
    required this.callback,
  });

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.pink,
        backgroundColor: AppColors.pink,
        fixedSize: Size(207, 45),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: Intl.getCurrentLocale() == 'uz' ? 14 : 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
