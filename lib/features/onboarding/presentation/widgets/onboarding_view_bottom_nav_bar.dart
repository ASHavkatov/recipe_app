import 'package:flutter/material.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';

import 'onboarding_elevatedbutton.dart';

class OnboardingViewBottomNavBar extends StatelessWidget {
  const OnboardingViewBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 135,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OnboardingElevatedButton(callback: () {}, title: MyLocalizations.of(context)!.iAmNew),
            OnboardingElevatedButton(callback: () {}, title: MyLocalizations.of(context)!.iHaveBeenHere),
          ],
        ),
      ),
    );
  }
}
