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

class DayTimeModel {
  String day;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  DayTimeModel({required this.day, this.startTime, this.endTime});
}

class EdAddDeleteScreen extends StatefulWidget {
  const EdAddDeleteScreen({Key? key}) : super(key: key);

  @override
  _EdAddDeleteScreenState createState() => _EdAddDeleteScreenState();
}

class _EdAddDeleteScreenState extends State<EdAddDeleteScreen> {
  List<DayTimeModel> dayTimes = [
    DayTimeModel(day: 'Monday', startTime: null, endTime: null),
    DayTimeModel(day: 'Tuesday', startTime: null, endTime: null),
    DayTimeModel(day: 'Wednesday', startTime: null, endTime: null),
    DayTimeModel(day: 'Thursday', startTime: null, endTime: null),
    DayTimeModel(day: 'Friday', startTime: null, endTime: null),
    DayTimeModel(day: 'Saturday', startTime: null, endTime: null),
    DayTimeModel(day: 'Sunday', startTime: null, endTime: null),
  ];

  final TextEditingController classNameController = TextEditingController();
  final TextEditingController classCodeController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    String? uid = userData.uid;

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
                    _buildFormField(context: context, label: 'Class Name', icon: Icons.class_, controller: classNameController),
                    _buildFormField(context: context, label: 'Class Code', icon: Icons.confirmation_number, controller: classCodeController),
                    _buildCard(label: 'Weekly Schedule', icon: Icons.schedule, child: _buildWeeklyScheduleField(context)),
                    _buildDatePickerField(context),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              CustomElevatedButton(
                height: 49,
                text: "Add".toUpperCase(),
                onPressed: () {
                  _addCourseToFirestore(uid);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildFormField({required BuildContext context, required String label, required IconData icon, required TextEditingController controller}) {
    if (label == 'Weekly Schedule') {
      return _buildCard(
        label: label,
        icon: icon,
        child: _buildWeeklyScheduleField(context),
      );
    } else {
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
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
      ),
    );
  }

  Widget _buildWeeklyScheduleField(BuildContext context) {
    return Column(
      children: dayTimes.map((dayTime) => _buildDayTimerField(context: context, dayTime: dayTime)).toList(),
    );
  }

  Widget _buildDayTimerField({required BuildContext context, required DayTimeModel dayTime}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8.0),
                Text(dayTime.day),
              ],
            ),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () => _selectTime(context, dayTime.startTime, (newTime) {
                setState(() {
                  dayTime.startTime = newTime;
                });
              }),
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
                      dayTime.startTime != null
                          ? dayTime.startTime!.format(context)
                          : 'Start Time',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () => _selectTime(context, dayTime.endTime, (newTime) {
                setState(() {
                  dayTime.endTime = newTime;
                });
              }),
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
                      dayTime.endTime != null
                          ? dayTime.endTime!.format(context)
                          : 'End Time',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(
      BuildContext context,
      TimeOfDay? selectedTime,
      Function(TimeOfDay) onTimeChanged,
      ) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      onTimeChanged(pickedTime);
    }
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
              setState(() {
                selectedDate = pickedDate;
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

  void _addCourseToFirestore(String? uid) {
    String className = classNameController.text;
    String classCode = classCodeController.text;

    // Check if all required fields are filled
    if (className.isEmpty || classCode.isEmpty) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      // Create a map with the data to be stored in Firestore, including schedules
      Map<String, dynamic> courseData = {
        'Educator ID': uid,
        'Name': className,
        'Period Date': selectedDate,
        'Date Added': DateTime.now(),
        'Schedules': dayTimes
            .where((dayTime) => dayTime.startTime != null && dayTime.endTime != null)
            .map((dayTime) => {
          'Day': dayTime.day,
          'StartTime': dayTime.startTime!.format(context),
          'EndTime': dayTime.endTime!.format(context),
        })
            .toList(),
      };

      // Add the course data to the 'Courses' collection
      FirebaseFirestore.instance.collection('Courses').doc(classCode).set(courseData);

      // Show a SnackBar for successful addition
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Course added!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    } catch (error) {
      // Show a SnackBar for errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding course. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Error: $error');
    }
  }

}