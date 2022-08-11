import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_themes.dart';
import '../models/weather_data.dart';
import '../constants/constants.dart';
import '../component/item_weather.dart';

class WeatherView extends StatelessWidget {
  WeatherData weather;
  WeatherView({required this.weather});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: [
          Expanded(flex: 3, child: buildToDayView()),
          const SizedBox(width: double.infinity, height: 10),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15, left: 25, bottom: 15),
            child: Text('Next days',
                style: TextStyle(color: AppColors.white, fontSize: 16)),
          ),
          Expanded(flex: 2, child: buildListDays())
        ],
      ),
    );
  }

  ListView buildListDays() => ListView.builder(
      itemBuilder: (BuildContext, index) {
        return ItemWeather(days: weather.days[index]);
      },
      itemCount: weather.days.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal);

  Stack buildToDayView() {
    return Stack(
      children: [
        Positioned(
            top: 5,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(weather.address.capitalize(),
                    style: TextStyle(color: AppColors.white, fontSize: 24)),
                Text(weather.timezone,
                    style: TextStyle(color: AppColors.white, fontSize: 14)),
              ],
            )),
        Positioned(child: Container(
          height: 400,
          margin: const EdgeInsets.only(top: 90, left: 20, right: 20),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white30.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 1,
                      margin: const EdgeInsets.only(bottom: 40),
                      width: double.infinity,
                      color: AppColors.white.withOpacity(0.3))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(weather.currentConditions.conditions,
                        style: TextStyle(color: AppColors.white, fontSize: 16)),
                  ))
            ],
          ),
        )),
        Positioned(
          top: 0,
          left: 40,
          child: Image(
              image: AssetImage(Utils.getAsset(weather)),
              height: 200,
              width: 200),
        ),
        Positioned(
          top: 160,
          right: 70,
          child: Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.white30.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text('Today',
                    style: TextStyle(color: AppColors.white, fontSize: 12)),
              )),
        ),
        Positioned(
            top: 220,
            right: 70,
            child: Text(Utils.convertFToC(weather.days.first.temp),
                style: TextStyle(color: AppColors.white, fontSize: 50))),
        Positioned(
            top: 225,
            left: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: AppColors.lightRed,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text(Utils.convertFToC(weather.days.first.tempmax),
                        style: TextStyle(color: AppColors.white, fontSize: 18)),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: AppColors.lightPurple,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text(Utils.convertFToC(weather.days.first.tempmin),
                        style: TextStyle(color: AppColors.white, fontSize: 18))
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
