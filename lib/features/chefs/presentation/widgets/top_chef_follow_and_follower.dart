import 'package:flutter/material.dart';

class TopChefFollowAndFollower extends StatelessWidget {
  const TopChefFollowAndFollower({super.key, required this.number, required this.title});
  final String number, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15, height: 1),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}