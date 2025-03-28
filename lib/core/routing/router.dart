import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/data/repositories/notifications_repository.dart';
import 'package:recipe_app/core/data/repositories/recipe_repository.dart';
import 'package:recipe_app/core/data/repositories/top_chef_repository.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/categories/presentation/manager/categories_cubit.dart';
import 'package:recipe_app/features/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/features/categories_detail/presentation/manager/categories_detail_view_model.dart';
import 'package:recipe_app/features/categories_detail/presentation/pages/categories_detail_view.dart';
import 'package:recipe_app/features/chefs/blocs/top_chef_bloc.dart';
import 'package:recipe_app/features/chefs/presentation/pages/top_chefs_pages/top_chefs_view.dart';
import 'package:recipe_app/features/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app/features/community/presentation/pages/community_view.dart';
import 'package:recipe_app/features/home/presentation/pages/home_view.dart';
import 'package:recipe_app/features/notifications/presentation/pages/notifications_view.dart';
import 'package:recipe_app/features/profile_followers/presentation/pages/profile_followers_view.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_detail_viewmodel.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_detail_view.dart';
import 'package:recipe_app/features/review/presentation/manager/reviews/reviews_bloc.dart';
import 'package:recipe_app/features/review/presentation/pages/add_review.dart';
import 'package:recipe_app/features/review/presentation/pages/review_view.dart';
import 'package:recipe_app/features/sign_up/presentation/pages/complete_profile_view.dart';
import 'package:recipe_app/features/top_chef_detail/blocs/top_chef_detail_bloc.dart';
import 'package:recipe_app/features/top_chef_detail/top_chefs_profile_pages/top_chefs_profile_view.dart';
import 'package:recipe_app/features/trending_recipes/blocs/trending_bloc.dart';
import 'package:recipe_app/features/trending_recipes/pages/trending_recipes_view.dart';
import 'package:recipe_app/features/your_recipes/blocs/your_recipes_bloc.dart';
import 'package:recipe_app/features/your_recipes/pages/your_recipe_view.dart';
import '../../features/categories/data/models/categories_model.dart';
import '../../features/notifications/bloc/notifications_bloc.dart';
import '../../features/onboarding/presentation/manager/onboarding_view_model.dart';
import '../../features/onboarding/presentation/pages/onboarding_view.dart';
import '../../features/profiles/presentation/pages/profile_page_view.dart';
import '../../features/review/presentation/manager/create_review/create_review_bloc.dart';
import '../../features/sign_up/presentation/pages/login_view.dart';
import '../../features/sign_up/presentation/pages/sign_up_view.dart';
import '../../main.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,

  initialLocation: Routes.follow,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 3),
        child: HomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(parent: animation, curve: Curves.easeOutQuart);
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(curve),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: Routes.review,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: ReviewView(),
      ),
    ),
    GoRoute(
      path: Routes.completeProfile,
      builder: (context, state) {
        return CompleteProfileView();
      },
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
        path: Routes.categories,
        builder: (context, state) => BlocProvider(
              create: (context) => CategoriesBloc(
                repo: context.read(),
              ),
              child: CategoriesView(),
            )),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(
        vm: OnboardingViewModel(
          repo: context.read(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.categoriesDetail,
      builder: (context, state) => CategoriesDetailView(
        viewModel:
            CategoriesDetailViewModel(repo: context.read(), catsRepo: context.read(), selected: state.extra as CategoryModel),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewmodel(
          repo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          communityRepo: context.read(),
        ),
        child: CommunityView(),
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
        child: CreateReviewView(),
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsBloc(
          chefRepo: context.read(),
        ),
        child: TopChefsView(),
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipe,
      builder: (context, state) => BlocProvider(
        create: (context) => TrendingBloc(
          trendRepo: RecipeRepository(
            client: ApiClient(),
          ),
        ),
        child: TrendingRecipesView(),
      ),
    ),
    GoRoute(
      path: Routes.notifications,
      builder: (context, state) => BlocProvider(
        create: (context) => NotificationsBloc(
          repo: NotificationsRepository(
            client: ApiClient(),
          ),
        ),
        child: NotificationsView(),
      ),
    ),
    GoRoute(
      path: Routes.myProfile,
      builder: (context, state) => ProfilePageView(),
    ),
    GoRoute(
      path: Routes.topChefDetail,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefDetailBloc(
          profileId: int.parse(state.pathParameters['profileId']!),
          repo: ChefRepository(
            client: ApiClient(),
          ),
        ),
        child: TopChefsProfileView(),
      ),
    ),
    GoRoute(
      path: Routes.yourRecipes,
      builder: (context, state) => BlocProvider(
        create: (context) => YourRecipeBloc(
          repo: RecipeRepository(client: ApiClient()),
        ),
        child: YourRecipeView(),
      ),
    ),
    GoRoute(
      path: Routes.follow,
      builder: (context, state) => ProfileFollowersView(),
    ),
  ],
);
