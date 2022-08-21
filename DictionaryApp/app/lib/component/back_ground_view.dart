import 'package:app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

Widget buildBackgroundView(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1),
    decoration: BoxDecoration(
      color: AppColors.gray,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      boxShadow: [
        BoxShadow( //  Đổ bóng cho Container view
          color: AppColors.gray,
          blurRadius: 15.0,
        ),
      ],
    ),
  );
}
