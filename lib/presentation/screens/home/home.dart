import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';
import 'package:news_app/presentation/screens/search_deligat/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
  }

  late Widget selectedWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
              ),
            ],
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(
        onCategoryClicked: onCategoryClicked,
      );
    } else if (item == MenuItem.settings) {
      selectedWidget = const Settings();
    }
    setState(() {});
  }

  void onCategoryClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(
      categoryDM: category,
    );
    setState(() {});
  }
}
