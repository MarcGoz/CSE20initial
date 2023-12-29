import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarcpogiItemWidget extends StatefulWidget {
  const MarcpogiItemWidget({Key? key}) : super(key: key);

  @override
  _MarcpogiItemWidgetState createState() => _MarcpogiItemWidgetState();
}

class _MarcpogiItemWidgetState extends State<MarcpogiItemWidget> {
  bool isAttendanceChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.v,
      width: 330.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 49.v,
              width: 330.h,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 49.v,
                    width: 330.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.imgAccess2),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                              "Name of Student",
                              style: CustomTextStyles.titleMediumMontserratBlack900,
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
          Positioned(
            right: 10.0,
            top: 10.0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isAttendanceChecked = !isAttendanceChecked;
                    });
                  },
                  icon: Icon(
                    isAttendanceChecked
                        ? FontAwesomeIcons.check
                        : FontAwesomeIcons.xmark,
                    color: isAttendanceChecked
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    // Show confirmation dialog before removing the person
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Confirm Removal"),
                        content: Text("Are you sure you want to remove this person from the course?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Implement the logic to remove the person from the course
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("Confirm"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.userMinus,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

