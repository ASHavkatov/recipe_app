import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_recipe_app/features/profile/data/models/profile_model.dart';

import '../../data/repositories/profile_repo.dart';

class complateProfileViewModel extends ChangeNotifier{

  complateProfileViewModel({ required ComplateProfileRepository profileRepo}) : _profileRepo = profileRepo{
    // load();
  }

  File? profilePhoto;

  bool loading= true;

  final ComplateProfileRepository _profileRepo;
  late  ProfileModel myProfile;

  // Future load() async{
  //   loading = true;
  //   notifyListeners();
  //
  //   myProfile = (await _profileRepo.uploadProfilePhoto(File file, int UserId))!;
  //   loading = false;
  //   notifyListeners();
  // }
  Future<void> pickProfilePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      profilePhoto = File(photo.path);
      notifyListeners();
    }
  }
}