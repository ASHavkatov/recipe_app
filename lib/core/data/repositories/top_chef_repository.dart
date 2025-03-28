import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/models/top_chef/top_chef_model.dart';
import 'package:recipe_app/core/data/models/top_chef/top_chef_model_small.dart';
import 'package:recipe_app/core/data/models/top_chef/top_chef_profile_model.dart';

class ChefRepository{
  ChefRepository({required this.client});
  final ApiClient client;
  List<TopChefModelSmall> topChefsHomePage = [];
  List<ChefModel> mostViewChefs = [];
  List<ChefModel> mostLikedChefs = [];
  List<ChefModel> newChefs = [];
  TopChefProfileModel? topChefProfile;

  Future<List<ChefModel>>fetchMostViewedChefs()async{
    var rawMostViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Date", "Limit":2, "Descending":false}
    );
    mostViewChefs = rawMostViewedChefs.map((chef)=> ChefModel.fromJson(chef)).toList();
    return mostViewChefs;
  }
  Future<List<ChefModel>>fetchMostLikedChefs()async{
    var rawMostLikedChefs = await client.genericGetRequest<List<dynamic>>(
        '/top-chefs/list',
        queryParams: { "Limit":2}
    );
    mostLikedChefs = rawMostLikedChefs.map((chef)=> ChefModel.fromJson(chef)).toList();
    return mostLikedChefs;
  }

  Future<List<ChefModel>>fetchNewChefs()async{
    var rawNewChefs = await client.genericGetRequest<List<dynamic>>(
        '/top-chefs/list',
        queryParams: {"Order": "Date", "Limit":2}
    );
    newChefs = rawNewChefs.map((chef)=> ChefModel.fromJson(chef)).toList();
    return newChefs;
  }
  
  Future<TopChefProfileModel> fetchTopChefProfile(int profileId) async{
    var rawChef = await client.genericGetRequest<dynamic>("/auth/details/$profileId");
    topChefProfile = TopChefProfileModel.fromJson(rawChef);
    return topChefProfile!;
  }
}