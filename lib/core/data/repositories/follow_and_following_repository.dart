import 'package:flutter/material.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/followers_and_following_model/followers_and_following_model.dart';

import '../../client.dart';


class FollowersAndFollowingRepository {
  FollowersAndFollowingRepository({required this.client});

  final ApiClient client;
  List<FollowersAndFollowingModel> followersModel= [];
  List<FollowersAndFollowingModel> following = [];

  Future<List<FollowersAndFollowingModel>> fetchFollowers(int id) async {
    try {
      var response = await client.genericGetRequest('/auth/followers/$id');
      if (response.statusCode == 200) {

        var rawFollowers = response.data as List;
        return rawFollowers.map((e) => FollowersAndFollowingModel.fromJson(e)).toList();
      } else {
        print("${response.statusCode}1111111111");
        throw Exception("Xatolik: ${response.statusMessage ?? "Noma'lum xatolik"}");
      }
    } catch (e) {
      debugPrint("Xatolik: $e");
      throw Exception("Followersni olishda xatolik: $e");
    }
  }


  Future<List<FollowersAndFollowingModel>> fetchFollowing(int id) async {
    try {
      final response = await client.dio.get('/auth/followings/$id');

      if (response.statusCode == 200 && response.data is List) {
        var rawFollowing = response.data as List<dynamic>;
        following = rawFollowing.map((e) => FollowersAndFollowingModel.fromJson(e)).toList();
        return following;
      } else {
        throw Exception("Followinglarni olib kelishda xatolik! Status kod: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Followinglarni olishda xatolik: $e");
    }
  }



  Future<bool>followBack(int userId)async{
    try{
      await client.genericPostRequest('/auth/follow/$userId',{});
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool>unFollow(int userId)async{
    try{
      await client.genericDeleteRequest('/auth/follow/$userId');
      return true;
    }catch(e){
      return false;
    }
  }
}
