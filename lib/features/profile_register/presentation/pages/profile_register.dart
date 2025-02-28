import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/profile_register_viewmodel.dart';
import '../widgets/avatar_image_picker.dart';
import '../widgets/bio_field.dart';
import '../widgets/continue_button.dart';
import '../widgets/gender_bottomsheet.dart';
import '../widgets/sub_title.dart';
import '../widgets/title.dart';

class RegisterProfile extends StatelessWidget {
  const RegisterProfile({super.key});

  @override
  Widget build(BuildContext context) {

    final pvm = context.watch<RegisterProfileViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36),
        children: [
          title(),
          SizedBox(height: 10),
          sub_title(),
          SizedBox(height: 44),
          avatar_image_picker(),
          GenderBottomSheet(pvm: pvm),
          SizedBox(height: 20),
          bio_field(),
          SizedBox(height: 200),
          continue_button(),
        ],
      ),
    );
  }
}
