import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class PermissionsItemWidget extends StatelessWidget {
  const PermissionsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 15.v,
        ),
        decoration: AppDecoration.outlineBlack90001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCamera,
              height: 16.v,
              width: 19.h,
              margin: EdgeInsets.only(
                left: 2.h,
                top: 7.v,
                bottom: 9.v,
              ),
            ),
            Container(
              width: 108.h,
              margin: EdgeInsets.only(left: 8.h),
              child: Text(
                "Allow to access camera.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall!.copyWith(
                  height: 1.11,
                ),
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgCombinedShape451,
              height: 21.v,
              width: 22.h,
              margin: EdgeInsets.only(
                top: 5.v,
                bottom: 6.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
