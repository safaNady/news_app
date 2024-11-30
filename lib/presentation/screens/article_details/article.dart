import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News Title',
            style: AppStyles.appBar,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: article.urlToImage ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                article.source!.name ?? '',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF79828B),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(article.title ?? '',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF42505C),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10.h,
              ),
              Text(article.publishedAt ?? '',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                      color: const Color(0xFFA3A3A3),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 20.h,
              ),
              Text(article.content ?? '',
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF42505C),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 200.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  onPressed: () async {
                    await _launchUrl(article.url ?? '');
                  },
                  iconAlignment: IconAlignment.end,
                  label: const Text('View Full Article'),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url');
    }
  }
}
