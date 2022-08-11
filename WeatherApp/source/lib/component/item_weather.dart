import 'package:flutter/material.dart';
import '../models/days.dart';
import '../theme/app_colors.dart';
import '../constants/constants.dart';

class ItemWeather extends StatelessWidget {
  Days days;
  ItemWeather({Key? key, required this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildItem();
  }

  Container buildItem() => Container(
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 140,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white30.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
            ),
            buildChild()
          ],
        ),
      );

  Column buildChild() {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Container(
          child: Image(
              image: AssetImage(Utils.getAsset(days)), height: 70, width: 70)),
      const Padding(padding: EdgeInsets.all(4)),
      Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                size: 18,
                Icons.arrow_upward,
                color: AppColors.lightRed,
              ),
              const Padding(padding: EdgeInsets.all(2)),
              Text(Utils.convertFToC(days.tempmax),
                  style: TextStyle(color: AppColors.white, fontSize: 14)),
            ],
          )),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
      Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                size: 18,
                Icons.arrow_downward,
                color: AppColors.lightPurple,
              ),
              const Padding(padding: EdgeInsets.all(2)),
              Text(Utils.convertFToC(days.tempmin),
                  style: TextStyle(color: AppColors.white, fontSize: 14))
            ],
          )),
      const Padding(padding: EdgeInsets.all(10)),
      Align(
        alignment: FractionalOffset.topRight,
        child: Text(days.datetime,
            style: TextStyle(color: AppColors.white, fontSize: 12)),
      )
    ]);
  }
}
