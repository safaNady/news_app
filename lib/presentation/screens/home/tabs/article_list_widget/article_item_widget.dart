import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutesManager.article_details, arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: article.urlToImage ?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              article.source!.name ?? '',
              style: GoogleFonts.poppins(
                  color: Color(0xFF79828B),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(article.title ?? '',
                style: GoogleFonts.poppins(
                    color: Color(0xFF42505C),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end,
                style: GoogleFonts.inter(
                    color: Color(0xFFA3A3A3),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
