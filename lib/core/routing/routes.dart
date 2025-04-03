
class Routes {
  static const home = '/';
  static const review = '/reviews/:recipeId';
  static const onboarding = '/onboarding';
  static const login = '/login_go';
  static const signup = '/sign_up';
  static const completeProfile = '/complete_profile';
  static const categoriesDetail = '/categoriesDetail';
  static const categories = '/categories';
  static const  community = '/community';
  static const recipeDetail = '/recipe-detail/:recipeId';
  static const createReview = '/create-review/:recipeId';
  static const topChefs = '/top-chefs';
  static const topChesProfile = '/top-chef_profile';
  static const trendingRecipe = '/trending-recipe';
  static const topChefDetail = '/top-chef/details';
  static String getTopChefDetail(int profileId) => '/auth/details/$profileId';
  static String recipeBuilder(int id)=>"/recipe-detail/$id";
  static String getReviews(int recipeId)=>'/reviews/$recipeId';
  static String getCreateReview(int recipeId)=> '/create-review/$recipeId';
  static const notifications = '/notifications/list';
  static const myProfile = '/auth/me';
  static const follow = '/auth/followers';
  static const yourRecipes = '/your-recipe';
  static const createRecipes = '/recipes/create';
}
