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
import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  late String className;
  late String classCode;
  late Map<String, Map<String, String>> weeklySchedule;
  late DateTime schoolPeriodEnds;
  late double latitude;
  late double longitude;

  Course({
    required this.className,
    required this.classCode,
    required this.weeklySchedule,
    required this.schoolPeriodEnds,
    required this.latitude,
    required this.longitude,
  });
}
class EdAddDeleteScreen extends StatefulWidget {
  EdAddDeleteScreen({Key? key}) : super(key: key);

  @override
  EdAddDeleteScreenState createState() => EdAddDeleteScreenState();
}



class EdAddDeleteScreenState extends State<EdAddDeleteScreen> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _classCodeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Map<String, TimeOfDay> _startTime = {};
  Map<String, TimeOfDay> _endTime = {};
  Map<String, Map<String, String>> _selectedDays = {};


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
                    _buildFormField(context: context, label: 'Class Name', icon: Icons.class_, controller: _classNameController),
                    _buildFormField(context: context, label: 'Class Code', icon: Icons.confirmation_number, controller: _classCodeController),
                    _buildCard(label: 'Weekly Schedule', icon: Icons.schedule, child: _buildWeeklyScheduleField(context)),
                    _buildDatePickerField(context),
                    _buildLocationFormField(context: context, label: 'Location', icon: Icons.location_on, latitudeController: _latitudeController, longitudeController: _longitudeController),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              CustomElevatedButton(
                height: 49,
                text: "Add".toUpperCase(),
                onPressed: () {
                  Course course = Course(
                    className: _classNameController.text,
                    classCode: _classCodeController.text,
                    weeklySchedule: _selectedDays,
                    schoolPeriodEnds: _selectedDate,
                    latitude: double.parse(_latitudeController.text),
                    longitude: double.parse(_longitudeController.text),
                  );

                  // Call a function to save the course to Firestore
                  _saveCourseToFirestore(course);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildLocationFormField({
    required BuildContext context,
    required IconData icon,
    required String label,
    required TextEditingController latitudeController,
    required TextEditingController longitudeController,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: latitudeController,
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
            controller: longitudeController,
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
  }

  Widget _buildFormField({
    required BuildContext context,
    required String label,
    required IconData icon,
    required TextEditingController controller}) {
    if (label == 'Weekly Schedule') {
      // Exempt validation for Weekly Schedule Days
      return _buildCard(
        label: label,
        icon: icon,
        child: _buildWeeklyScheduleField(context),
      );
    } else {
      // For other fields, make them required
      return TextFormField(
        controller: controller,
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
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    return Column(
      children: days.map((day) {
        return _buildDayTimerField(
          context: context,
          day: day,
          startTime: _startTime[day] ?? TimeOfDay.now(),
          endTime: _endTime[day] ?? TimeOfDay.now(),
          onStartTimeChanged: (newTime) {
            setState(() {
              _startTime[day] = newTime;
              _updateSelectedDays(day);
            });
          },
          onEndTimeChanged: (newTime) {
            setState(() {
              _endTime[day] = newTime;
              _updateSelectedDays(day);
            });
          },
        );
      }).toList(),
    );
  }
  void _updateSelectedDays(String day) {
    String startTime = _startTime[day]?.format(context) ?? '';
    String endTime = _endTime[day]?.format(context) ?? '';

    if (startTime.isNotEmpty && endTime.isNotEmpty) {
      setState(() {
        _selectedDays[day] = {'start': startTime, 'end': endTime};
      });
    } else {
      setState(() {
        _selectedDays.remove(day);
      });
    }
  }

  Widget _buildDayTimerField({
    required BuildContext context,
    required String day,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required Function(TimeOfDay) onStartTimeChanged,
    required Function(TimeOfDay) onEndTimeChanged,
  }) {
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
            onTap: () async {
              TimeOfDay? pickedStartTime = await showTimePicker(
                context: context,
                initialTime: startTime,
              );

              if (pickedStartTime != null) {
                // Call the callback function to update the state
                onStartTimeChanged(pickedStartTime);
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
                    '${startTime.format(context)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Icon(Icons.access_time),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: InkWell(
            onTap: () async {
              TimeOfDay? pickedEndTime = await showTimePicker(
                context: context,
                initialTime: endTime,
              );

              if (pickedEndTime != null) {
                // Call the callback function to update the state
                onEndTimeChanged(pickedEndTime);
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
                    '${endTime.format(context)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Icon(Icons.access_time),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickerField(BuildContext context) {
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
              initialDate: _selectedDate,
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

            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
              });
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
                  DateFormat('yyyy-MM-dd').format(_selectedDate),
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
  Future<void> _saveCourseToFirestore(Course course) async {
    try {
      // Get a reference to the 'Course' collection
      CollectionReference courseCollection = FirebaseFirestore.instance.collection('Courses');

      // Add the course data to Firestore
      await courseCollection.add({
        'className': course.className,
        'classCode': course.classCode,
        'weeklySchedule': course.weeklySchedule,
        'schoolPeriodEnds': course.schoolPeriodEnds,
        'latitude': course.latitude,
        'longitude': course.longitude,
      });

      // Show a success message or navigate to another screen if needed
      print('Course added to Firestore successfully!');

      // Navigate back to the dashboard
      Navigator.of(context).pushReplacementNamed(AppRoutes.teacherDashboardHomeScreen);
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error adding course to Firestore: $e');
    }
  }
}
