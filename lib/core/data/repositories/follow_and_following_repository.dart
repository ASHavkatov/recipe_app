import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/followers_and_following_model/followers_and_following_model.dart';

class FollowersAndFollowingRepository {
  FollowersAndFollowingRepository({required this.client});

  final ApiClient client;
  List<FollowersAndFollowingModel> followersModel= [];

  Future<List<FollowersAndFollowingModel>> fetchFollowers(int id)async{
    var rawFollowers = await client.genericGetRequest<List<dynamic>>('/auth/followers/$id');
    followersModel = rawFollowers.map((e)=> FollowersAndFollowingModel.fromJson(e)).toList();
    return followersModel;
  }

  Future<List<FollowersAndFollowingModel>> fetchFollowing(int id)async{
    var rawFollowers = await client.genericGetRequest<List<dynamic>>('/auth/followings/$id');
    followersModel = rawFollowers.map((e)=> FollowersAndFollowingModel.fromJson(e)).toList();
    return followersModel;
  }
}
