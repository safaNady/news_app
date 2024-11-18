import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static TextStyle drawerTitle = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle categories = GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static TextStyle settings = GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static TextStyle pickCategory = GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.gray);
  static TextStyle categoryTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
}
