import 'package:flutter/material.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/presentation/screens/home/tabs/article_list_widget/article_item_widget.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsManager.green,
        ),
        inputDecorationTheme:
            const InputDecorationTheme(border: InputBorder.none));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 30,
        color: ColorsManager.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: ApiManager.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null || snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        var articlesResponse = snapshot.data as ArticlesResponse;
        if (articlesResponse.articles == null ||
            articlesResponse.articles!.isEmpty) {
          return const Center(child: Text('no result found'));
        }
        return ListView.builder(
          itemBuilder: (context, index) => ArticleItemWidget(
              article: articlesResponse.articles![index] as Article),
          itemCount: articlesResponse.articles?.length ?? 0,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: ApiManager.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null || snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        var articlesResponse = snapshot.data as ArticlesResponse;
        if (articlesResponse.articles == null ||
            articlesResponse.articles!.isEmpty) {
          return const Center(child: Text('no result found'));
        }
        return ListView.builder(
          itemBuilder: (context, index) => ArticleItemWidget(
              article: articlesResponse.articles![index] as Article),
          itemCount: articlesResponse.articles?.length ?? 0,
        );
      },
    );
  }
}
