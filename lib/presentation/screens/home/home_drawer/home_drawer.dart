import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/strings_manager.dart';

typedef OnMenuItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});

  OnMenuItemClicked onMenuItemClicked;

  static const categories = 1;
  static const settings = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: Text(
              StringsManager.drawerTitle,
              style: AppStyles.drawerTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildDrawerItem(
                    icon: Icons.list,
                    text: StringsManager.categories,
                    onClicked: onMenuItemClicked,
                    item: MenuItem.categories),
                SizedBox(
                  height: 12.h,
                ),
                buildDrawerItem(
                    icon: Icons.settings,
                    text: StringsManager.settings,
                    onClicked: onMenuItemClicked,
                    item: MenuItem.settings)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    IconData? icon,
    required String text,
    required MenuItem item,
    required OnMenuItemClicked onClicked,
  }) {
    return InkWell(
      onTap: () {
        onClicked(item);
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: AppStyles.categories,
          ),
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
