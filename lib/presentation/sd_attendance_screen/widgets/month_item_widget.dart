import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class MonthItemWidget extends StatelessWidget {
  const MonthItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.h,
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 8.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup77,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              top: 13.v,
              bottom: 11.v,
            ),
            child: Text(
              "November 12, 2023",
              style: CustomTextStyles.titleMediumMontserratBlack900,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgClose,
            height: 37.v,
            width: 32.h,
            margin: EdgeInsets.only(bottom: 11.v),
          ),
        ],
      ),
    );
  }
}
