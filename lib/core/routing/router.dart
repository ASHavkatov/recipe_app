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
import 'package:recipe_app/features/recipe_create_y/presentation/pages/recipe_create_view_y.dart';
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
import '../../features/followers_and_following/pages/profile_followers_view.dart';
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
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: HomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutQuart,
            )),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: LoginView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.review,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => ReviewsBloc(
            recipeRepo: context.read(),
            recipeId: int.parse(state.pathParameters['recipeId']!),
          ),
          child: ReviewView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.completeProfile,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: CompleteProfileView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.signup,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: SignUpView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.categories,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => CategoriesBloc(repo: context.read()),
          child: CategoriesView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.onboarding,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: OnboardingView(
          vm: OnboardingViewModel(repo: context.read()),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.categoriesDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: CategoriesDetailView(
          viewModel: CategoriesDetailViewModel(
            repo: context.read(),
            catsRepo: context.read(),
            selected: state.extra as CategoryModel,
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: ChangeNotifierProvider(
          create: (context) => RecipeDetailViewmodel(
            repo: context.read(),
            recipeId: int.parse(state.pathParameters['recipeId']!),
          ),
          child: RecipeDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.community,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: ChangeNotifierProvider(
          create: (context) => CommunityViewModel(
            communityRepo: context.read(),
          ),
          child: CommunityView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => CreateReviewBloc(
            recipeRepo: context.read(),
            reviewRepo: context.read(),
          )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
          child: CreateReviewView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => TopChefsBloc(chefRepo: context.read()),
          child: TopChefsView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipe,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => TrendingBloc(
            trendRepo: RecipeRepository(client: ApiClient()),
          ),
          child: TrendingRecipesView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.notifications,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: BlocProvider(
          create: (context) => NotificationsBloc(
            repo: NotificationsRepository(client: ApiClient()),
          ),
          child: NotificationsView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: Routes.myProfile,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 300),
        child: ProfilePageView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);
