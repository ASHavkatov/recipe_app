import 'package:new_recipe_app/core/client.dart';
import 'package:new_recipe_app/features/recipe_detail/presetation/recipe_detail_repository/recipe_detail_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => RecipeRepository(
      client: context.read(),
    ),
  ),
];
