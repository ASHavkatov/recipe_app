import 'package:new_recipe_app/features/community/data/models/community_model.dart';
import '../../../../core/client.dart';

class CommunityRepository {
  final ApiClient client;
  List<CommunityModel> community = [];

  CommunityRepository({
    required this.client,
  });

  Future<List<CommunityModel>> fetchCommunityRecipes({required String orderBy, bool descending = true}) async {
    var rawCommunity = await client.fetchCommunityRecipes(order: orderBy, descending: descending);
    community = rawCommunity.map((e) => CommunityModel.fromJson(e)).toList();
    return community;
  }

}
