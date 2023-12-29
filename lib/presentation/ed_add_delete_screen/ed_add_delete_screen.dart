import 'package:flutter/material.dart';
import 'package:facetap/core/app_export.dart';
import 'package:facetap/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:facetap/widgets/app_bar/custom_app_bar.dart';
import 'package:facetap/widgets/custom_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:facetap/user_data.dart';
import 'package:intl/intl.dart';
import 'package:facetap/widgets/custom_elevated_button.dart';

class EdAddDeleteScreen extends StatelessWidget {
  EdAddDeleteScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to .sdAttendanceOneScreen
                          Navigator.pop(context);
                        },
                        child: CustomImageView(
                          imagePath: ImageConstant.imgFrameBlack90001,
                          height: 30.0,
                          width: 10.0,
                          margin: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 29.0),
                        child: Text(
                          "Add a Class",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              Expanded(
                child: ListView(
                  children: [
                    _buildFormField(context: context, label: 'Class Name', icon: Icons.class_),
                    _buildFormField(context: context, label: 'Class Code', icon: Icons.confirmation_number),
                    _buildCard(label: 'Weekly Schedule', icon: Icons.schedule, child: _buildWeeklyScheduleField(context)),
                    _buildDatePickerField(context),
                    _buildFormField(context: context, label: 'Location', icon: Icons.location_on),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              CustomElevatedButton(
                height: 49,
                text: "Add".toUpperCase(),
                onPressed: () {
                  print("Saved!");
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildFormField({required BuildContext context, required String label, required IconData icon}) {
    if (label == 'Weekly Schedule') {
      // Exempt validation for Weekly Schedule Days
      return _buildCard(
        label: label,
        icon: icon,
        child: _buildWeeklyScheduleField(context),
      );
    } else if (label == 'Location') {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Latitude',
                icon: Icon(icon),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Longitude',
                icon: Icon(icon),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
        ],
      );
    } else {
      // For other fields, make them required
      return TextFormField(
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      );
    }
  }


  Widget _buildCard({required String label, required IconData icon, required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyScheduleField(BuildContext context) {
    return Column(
      children: [
        _buildDayTimerField(context: context, day: 'Monday'),
        _buildDayTimerField(context: context, day: 'Tuesday'),
        _buildDayTimerField(context: context, day: 'Wednesday'),
        _buildDayTimerField(context: context, day: 'Thursday'),
        _buildDayTimerField(context: context, day: 'Friday'),
        _buildDayTimerField(context: context, day: 'Saturday'),
        _buildDayTimerField(context: context, day: 'Sunday'),
      ],
    );
  }

  Widget _buildDayTimerField({required BuildContext context, required String day}) {
    TimeOfDay selectedTime = TimeOfDay.now();

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 8.0),
              Text(day),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: InkWell(
            onTap: null,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Time',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Icon(Icons.access_time),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickerField(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'School Period Ends',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: Colors.teal,
                    colorScheme: const ColorScheme.light(primary: Colors.teal),
                    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null && pickedDate != selectedDate) {
              selectedDate = pickedDate;
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(selectedDate),
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    return CustomAppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Fac".toUpperCase(),
                style: theme.textTheme.headlineLarge,
              ),
              TextSpan(
                text: "E".toUpperCase(),
                style: theme.textTheme.headlineLarge,
              ),
              TextSpan(
                text: "TAP".toUpperCase(),
                style: CustomTextStyles.headlineLargePrimary,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
            },
            child: userData.image != null
                ? AppbarTrailingCircleimage(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
              },
              imagePath: userData.image!,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0,
              ),
            )
                : const FaIcon(
              FontAwesomeIcons.circleUser,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        switch (type) {
          case BottomBarEnum.Attendance:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edAttendanceOneScreen);
            break;
          case BottomBarEnum.Notification:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edNotificationScreen);
            break;
          case BottomBarEnum.Settings:
            Navigator.of(context).pushReplacementNamed(AppRoutes.edSettingsScreen);
            break;
          case BottomBarEnum.Home:
            Navigator.of(context).pushReplacementNamed(AppRoutes.teacherDashboardHomeScreen);
            break;
        }
      },
      getCurrentPage: () {
        return BottomBarEnum.Attendance;
      },
    );
  }
}
