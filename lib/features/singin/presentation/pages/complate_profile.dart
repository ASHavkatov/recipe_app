import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_recipe_app/core/utils/app_colors.dart';
import 'package:new_recipe_app/features/singin/presentation/widgets/app_bar.dart';
import 'package:new_recipe_app/core/sizes.dart';
import '../manager/complate_profile_view_model.dart';
import '../widgets/comlete_profile_gender.dart';
import '../widgets/profile_text_field.dart';

class ComplateProfile extends StatelessWidget {
  const ComplateProfile({super.key, required this.vm});

  final complateProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.MainColor,
        title: appBarTitle(text: 'Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.padding36),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Lorem ipsum dolor sit amet pretium cras id dui\npellentesque ornare. Quisque malesuada netus\npulvinar diam.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              // Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       Container(
              //         width: 100,
              //         height: 100,
              //         decoration: BoxDecoration(
              //           color: AppColors.Pink,
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //         child: Center(child: SvgPicture.asset('assets/icons/odamcha.svg')),
              //       ),
              //       Positioned(
              //           top: 66,
              //           left: 74,
              //           child: Container(
              //             height: 30,
              //             width: 30,
              //             decoration: BoxDecoration(
              //               color: AppColors.ReddishPink,
              //               borderRadius: BorderRadius.circular(8),
              //             ),
              //             child: Center(
              //               child: SvgPicture.asset(
              //                 'assets/icons/qalamcha.svg',
              //               ),
              //             ),
              //           ))
              //     ]),
              Center(
                child: ProfileImagePicker(vm: vm),
              ),
              SizedBox(height: 50),
              CompleteProfileGender(),
              SizedBox(height: 14),
              ProfileTextField(title: 'Bio', text: 'About yourself'),
            ],
          ),
        ],
      ),
    );
  }
}



class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key, required this.vm});

  final complateProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.Pink,
            radius: 50,
            child: vm.profilePhoto == null
                ? Center(
                  child: SvgPicture.asset(
                                  "assets/icons/odamcha.svg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                )
                : Image.file(
              vm.profilePhoto!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                await vm.pickProfilePhoto();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.ReddishPink,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/qalamcha.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

