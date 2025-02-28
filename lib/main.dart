import 'package:flutter/material.dart';
import 'package:new_recipe_app/core/sizes.dart';
import 'package:new_recipe_app/core/utils/theme.dart';
import 'package:provider/provider.dart';
import 'core/dependencies.dart';
import 'core/go_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: GoRoutes.router,
      ),
    );
  }
}
