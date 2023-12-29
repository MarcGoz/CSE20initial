  static Map<String, WidgetBuilder> routes = {
    sdAttendanceScreen: (context) => SdAttendanceScreen(),
    studentDashboardClockInScreen: (context) => StudentDashboardClockInScreen(),
    permissionsScreen: (context) => PermissionsScreen(),
    chooseARoleScreen: (context) => ChooseARoleScreen(),
    studentDashboardClockInScreen: (context) => const StudentDashboardClockInScreen(),
    permissionsScreen: (context) => const PermissionsScreen(),
    chooseARoleScreen: (context) => const ChooseARoleScreen(),

    signInAsStudentScreen: (context) => SignInAsStudentScreen(),
    registerStudentScreen: (context) => StudentRegisterScreen(),
    signInAsStudentScreen: (context) => const SignInAsStudentScreen(),
    registerStudentScreen: (context) => const StudentRegisterScreen(),

    sdHomeFacialRecognitionScreen: (context) => SdHomeFacialRecognitionScreen(),
    splashScreen: (context) => SplashScreen(),
    sdHomeFacialRecognitionScreen: (context) => const SdHomeFacialRecognitionScreen(),
    splashScreen: (context) => const SplashScreen(),
    studentDashboardHomeScreen: (context) => StudentDashboardHomeScreen(),
    sdAttendanceOneScreen: (context) => SdAttendanceOneScreen(),
    sdNotificationScreen: (context) => SdNotificationScreen(),
    sdSettingsScreen: (context) => SdSettingsScreen(),
    edNotificationScreen: (context) => EdNotificationScreen(),
    sdNotificationScreen: (context) => const SdNotificationScreen(),
    sdSettingsScreen: (context) => const SdSettingsScreen(),
    edNotificationScreen: (context) => const EdNotificationScreen(),

    signInAsEducatorScreen: (context) => SignInAsEducatorScreen(),
    registerEducatorScreen: (context) => EducatorRegisterScreen(),
    signInAsEducatorScreen: (context) => const SignInAsEducatorScreen(),
    registerEducatorScreen: (context) => const EducatorRegisterScreen(),

    teacherDashboardHomeScreen: (context) => TeacherDashboardHomeScreen(),
    edSettingsScreen: (context) => EdSettingsScreen(),
    edSettingsScreen: (context) => const EdSettingsScreen(),
    edAttendanceOneScreen: (context) => EdAttendanceOneScreen(),
    edAddDeleteScreen: (context) => EdAddDeleteScreen(),
    edAttendanceScreen: (context) => EdAttendanceScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
    appNavigationScreen: (context) => const AppNavigationScreen()
  };
}
