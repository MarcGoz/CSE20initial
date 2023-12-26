import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class TwentyfiveItemWidget extends StatelessWidget {
  const TwentyfiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.v,
      width: 125.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 11.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup77,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "25",
              style: CustomTextStyles.displayMediumPrimary,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Text(
                "Total Present",
                style: CustomTextStyles.bodyMediumRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
