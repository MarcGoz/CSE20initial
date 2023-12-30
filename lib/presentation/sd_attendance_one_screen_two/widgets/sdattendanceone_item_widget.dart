import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class SdattendanceoneItemWidget extends StatelessWidget {
  SdattendanceoneItemWidget({
    Key? key,
    this.onTapSubject,
  }) : super(
          key: key,
        );

  VoidCallback? onTapSubject;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.h,
      child: GestureDetector(
        onTap: () {
          onTapSubject!.call();
        },
        child: Container(
          decoration: AppDecoration.outlineBlack900012,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: Text(
                    "20%".toUpperCase(),
                    style: CustomTextStyles.titleSmallOnPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 36.v),
              SizedBox(
                height: 54.v,
                width: 150.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 5.v,
                        ),
                        decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Professional Track 2",
                              style: CustomTextStyles.montserratBlack90001Bold,
                            ),
                            SizedBox(height: 1.v),
                            Text(
                              "PTF20".toUpperCase(),
                              style: CustomTextStyles.labelLargeBlack90001,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 36.adaptSize,
                        width: 36.adaptSize,
                        margin: EdgeInsets.only(right: 7.h),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onError,
                          borderRadius: BorderRadius.circular(
                            18.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
