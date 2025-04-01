import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/followers_and_following_model/followers_and_following_model.dart';

class FollowersAndFollowingRepository {
  FollowersAndFollowingRepository({required this.client});

  final ApiClient client;
  List<FollowersAndFollowingModel> followersModel= [];

  Future<List<FollowersAndFollowingModel>> fetchFollowers(int id)async{
    var rawFollowers = await client.genericGetRequest<List<dynamic>>('/auth/followers/$id');
    followersModel = rawFollowers.map((e)=> FollowersAndFollowingModel.fromJson(e)).toList();
    if (followersModel.isNotEmpty) {
      return followersModel;
    }  else{
      throw
    Exception("Followerslarni olib kelishda hatoliklar bor");
    }
  }

  Future<List<FollowersAndFollowingModel>> fetchFollowing(int id)async{
    var rawFollowers = await client.genericGetRequest<List<dynamic>>('/auth/followings/$id');
    followersModel = rawFollowers.map((e)=> FollowersAndFollowingModel.fromJson(e)).toList();
    if (followersModel.isNotEmpty) {
      return followersModel;
    }  else{
      throw
    Exception("Followinglarni olib kelishda hatolik bor");
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
