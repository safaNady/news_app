import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Language',
            style: GoogleFonts.poppins(
                fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
