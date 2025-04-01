import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/followers_and_following_model/followers_and_following_model.dart';

class FollowersAndFollowingRepository {
  FollowersAndFollowingRepository({required this.client});

  final ApiClient client;
  List<FollowersAndFollowingModel> followersModel= [];
  List<FollowersAndFollowingModel> following = [];

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

  Future<List<FollowersAndFollowingModel>> fetchFollowing(int id) async {
    final response = await client.dio.get('/auth/followings/$id');
    if (response.statusCode == 200) {
      var rawFollowers = response.data as List<dynamic>;
      following = rawFollowers.map((e) => FollowersAndFollowingModel.fromJson(e)).toList();
      return following;
    } else {
      throw Exception("Followinglarni olib kelishda xatolik! Status kod: ${response.statusCode}");
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
