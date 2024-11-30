import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sourses_response/sources.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_tab_widget/sources_tab_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    print(ApiManager.getSources(categoryDM.id));
    return FutureBuilder(
      future: ApiManager.getSources(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Text(snapshot.data?.message ?? 'check internet connection');
        }
        List<Source> sources = snapshot.data?.sources ?? [];
        return SourcesTabWidget(sources: sources);
      },
    );
  }
}
