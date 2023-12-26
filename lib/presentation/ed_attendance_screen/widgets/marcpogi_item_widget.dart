import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class MarcpogiItemWidget extends StatelessWidget {
  const MarcpogiItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.v,
      width: 330.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAccess1,
            height: 49.v,
            width: 330.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 49.v,
              width: 330.h,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAccess2,
                    height: 49.v,
                    width: 330.h,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.h),
                      child: Row(
                        children: [
                          Container(
                            height: 26.adaptSize,
                            width: 26.adaptSize,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onError,
                              borderRadius: BorderRadius.circular(
                                13.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 7.h,
                              top: 2.v,
                            ),
                            child: Text(
                              "Marc Pogi",
                              style: CustomTextStyles
                                  .titleMediumMontserratBlack900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
