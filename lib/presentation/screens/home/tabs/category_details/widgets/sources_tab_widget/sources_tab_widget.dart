import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sourses_response/sources.dart';
import 'package:news_app/presentation/screens/home/tabs/article_list_widget/article_list_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_tab_widget/source_item_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  SourcesTabWidget({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              tappedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: REdgeInsets.symmetric(horizontal: 8),
            isScrollable: true,
            tabs: widget.sources
                .map((source) => SourceItemWidget(
                    source: source,
                    isSelected: widget.sources.indexOf(source) == tappedIndex))
                .toList(),
          ),
        ),
        ArticleListWidget(
          source: widget.sources[tappedIndex],
        ),
      ],
    );
  }
}
