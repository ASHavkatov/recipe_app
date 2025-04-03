import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/chefs/blocs/top_chef_bloc.dart';
import 'package:recipe_app/features/chefs/blocs/top_chefs_state.dart';
import 'package:recipe_app/features/chefs/presentation/widgets/top_chefs_section_image_title.dart';

class TopChefsNewchefs extends StatelessWidget {
  const TopChefsNewchefs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsBloc, TopChefsState>(builder: (context, state){
      if (state is TopChefsLoading) {
        return Center(child: CircularProgressIndicator());
      }else{
        return Padding(
          padding: const EdgeInsets.only(left: 36, right: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Chefs',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var chef in state.newChefs)
                    TopChefsSectionImageTitle(image: chef.image, title: chef.firstName, username: chef.username, rating: 5484)
                ],
              )
            ],
          ),
        );
      }
    });

  }
}
