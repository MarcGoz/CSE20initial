import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';

// ignore: must_be_immutable
class SdnotificationoneItemWidget extends StatelessWidget {
  const SdnotificationoneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        children: [
          Container(
            width: 38.adaptSize,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillBlue.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder19,
            ),
            child: Text(
              "M",
              style: theme.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 17.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mathematics I",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Text(
                          "09:30 am",
                          style:
                              CustomTextStyles.bodySmallErrorContainerRegular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.v),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Marc is marked ",
                          style: CustomTextStyles.bodySmallErrorContainer,
                        ),
                        TextSpan(
                          text: "present",
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
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
