import 'package:gym_app/export.dart';

extension AppFonts on Text {

  Text title([Color? color]) {
    final TextStyle textStyle = GoogleFonts.itim(
      fontWeight: FontWeight.w400,
      fontSize: 2.7.h,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text subtitle([Color? color]) {
    final TextStyle textStyle = GoogleFonts.itim(
      fontWeight: FontWeight.w400,
      fontSize: 2.4.h,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text header([Color? color]) {
    final TextStyle textStyle = GoogleFonts.itim(
      fontWeight: FontWeight.w400,
      fontSize: 2.2.h,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text body1([Color? color]) {
    final TextStyle textStyle = GoogleFonts.itim(
      fontWeight: FontWeight.w400,
      fontSize: 1.9.h,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text body2([Color? color]) {
    final TextStyle textStyle = GoogleFonts.itim(
      fontWeight: FontWeight.w400,
      fontSize: 1.7.h,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }
}