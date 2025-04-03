  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
  import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/utils/format_date.dart';
  import 'package:recipe_app/features/categories/presentation/widgets/recipe_bottom_navigationbar.dart';

  import 'package:recipe_app/features/review/presentation/widgets/recipe_review_app_bar.dart';

import '../../bloc/notifications_bloc.dart';
import '../../bloc/notifications_state.dart';

  class NotificationsView extends StatefulWidget {
    const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {

  String formNimadir(String inputDate) {
    print(inputDate);
    DateTime date = DateTime.parse(inputDate);
    DateTime now = DateTime.now();

    if (DateFormat("yyyy-MM-dd").format(date) == DateFormat("yyyy-MM-dd").format(now)) {
      return "Today";
    } else {
      return DateFormat("EEEE", "en_US").format(date); // Haftaning kunini chiqaradi
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBody: true,
        appBar: RecipeReviewAppBar(title: 'Notification'),
        body: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            DateTime? previousDate; // Oldingi sanani saqlash uchun

            return switch (state.notificationStatus) {
              NotificationStatus.idle => const Text("Idlda xato bot"),
              NotificationStatus.loading => const Center(child: CircularProgressIndicator()),
              NotificationStatus.error => const Text('Errorr'),
              NotificationStatus.success => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  final currentDate = notification.date;

                  // Bugungi sanani olish
                  // final today = DateTime.now();
                  // final isToday = currentDate.year == today.year &&
                  //     currentDate.month == today.month &&
                  //     currentDate.day == today.day;
                  //
                  // // Faqat birinchi marta sanani chiqarish
                  // final bool shouldShowDate = previousDate == null ||
                  //     previousDate!.day != currentDate.day ||
                  //     previousDate!.month != currentDate.month ||
                  //     previousDate!.year != currentDate.year;
                  //
                  // previousDate = currentDate; // Avvalgi sanani yangilash

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        Text(
                          "${formNimadir(state.notifications[index].date.toIso8601String())}",
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
                            SizedBox(width: 12),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/svg/star.svg",
                                  height: 27,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  notification.title,
                                  style: TextStyle(
                                    color: AppColors.pinkSub,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(
                                  width: 252.w,
                                  child: Text(
                                    notification.subtitle,
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${formatDate(state.notifications[index].date.toIso8601String())}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              _ => const Text('null'),
            };
          },
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
}
