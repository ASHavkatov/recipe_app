import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';
import 'package:recipe_app/features/review/presentation/widgets/recipe_review_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeReviewAppBar(title: "Notifications"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: ListView.builder(itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date",
                style: TextStyle(fontFamily: "Poppins", fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Container(
                width: 355,
                height: 75,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(23)),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svg/star.svg",
                          height: 27,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weekly New Recipes!",
                          style: TextStyle(
                              color: AppColors.pinkSub, fontWeight: FontWeight.w500, fontSize: 15, fontFamily: "Poppins"),
                        ),
                        Text(
                          "Discover our new recipes of the week!",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Time",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w300,fontSize: 12,fontFamily: "Poppins" ),),
                ],
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
