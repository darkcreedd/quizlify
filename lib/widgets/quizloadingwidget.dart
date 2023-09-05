import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuizLoadingWidget extends StatelessWidget {
  const QuizLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 700.h,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false,
        disableCenter: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Stack(
          fit: StackFit.loose,
          children: [
            Container(
              color: Colors.transparent,
              height: 700.h,
              width: 343.w,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 568.h,
                width: 343.w,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Container(
                    margin: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 20.h),
                    child: Center(
                      child: SpinKitChasingDots(
                        itemBuilder: (BuildContext context, int index) {
                          return const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.white),
                          );
                        },
                      ),
                    )),
              ),
            ),
            Positioned(
              bottom: 510.h,
              left: 110.w,
              child: CircleAvatar(
                radius: 55.w,
                backgroundImage: const AssetImage(
                    "assets/images/albert-einstein-cartoon.jpg"),
              ),
            )
          ],
        );
      },
    );
  }
}
