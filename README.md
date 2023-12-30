
<div align="center">
  <img src="https://firebasestorage.googleapis.com/v0/b/facetap-24df3.appspot.com/o/logo-facetap.png?alt=media&token=0398ca88-f704-4b8b-a4e0-d89847af2c88" alt="FaceTap Logo" height="400px" />
</div>

FaceTap, an innovative mobile application designed to revolutionize attendance tracking using facial recognition technology.

### System Requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Project Structure

```plaintext
.
├── 🤖 android                         - Contains files required to run the application on an Android platform.
├── 🎨 assets                          - Contains all images and fonts of your application.
├── 🍏 ios                             - Contains files required to run the application on an iOS platform.
├── 📁 lib                             - Most important folder in the application, used to write most of the Dart code.
│   ├── main.dart                   - Starting point of the application
│   ├── 🧠 core
│   │   ├── app_export.dart         - Contains commonly used file imports
│   │   ├── constants               - Contains static constant class file
│   │   └── utils                   - Contains common files and utilities of the application
│   ├── 🎨 presentation                - Contains widgets of the screens
│   │   ├── app_navigation_screen
│   │   ├── choose_a_role_screen
│   │   ├── ed_add_delete_screen
│   │   ├── ed_attendance_one_screen
│   │   ├── ed_attendance_screen
│   │   ├── ed_notification_screen
│   │   ├── ed_settings_screen
│   │   ├── educator_register_screen
│   │   ├── permissions_screen
│   │   ├── sd_attendance_one_screen
│   │   ├── sd_attendance_screen
│   │   ├── sd_home_facial_recognition_screen
│   │   ├── sd_notification_screen
│   │   ├── sd_settings_screen
│   │   ├── sign_in_as_educator_screen
│   │   ├── sign_in_as_student_screen
│   │   ├── splash_screen
│   │   ├── student_dashboard_clock_in_screen
│   │   ├── student_dashboard_home_screen
│   │   ├── student_register_screen
│   │   └── teacher_dashboard_home_screen
│   ├── 🛣️ routes                      - Contains all the routes of the application
│   │   └── app_routes.dart 
│   ├── 🎨 theme                       - Contains app theme and decoration classes
│   │   ├── app_decoration.dart
│   │   ├── custom_button_style.dart
│   │   ├── custom_text_style.dart
│   │   └── theme_helper.dart
│   └── 🧩 widgets                     - Contains all custom widget classes
│       ├── 📚 app_bar
│       │   ├── appbar_leading_circleimage.dart
│       │   ├── appbar_leading_image.dart
│       │   ├── appbar_subtitle.dart
│       │   ├── appbar_subtitle_one.dart
│       │   ├── appbar_trailing_circleimage.dart
│       │   └── custom_app_bar.dart
│       ├── base_button.dart
│       ├── custom_bottom_bar.dart
│       ├── custom_checkbox_button.dart
│       ├── custom_elevated_button.dart
│       ├── custom_image_view.dart
│       ├── custom_outlined_button.dart
│       └── custom_text_form_field.dart
├── 🧪 test                            - Contains test files
│   └── widget_test.dart
├── .gitignore                      - Configuration file for Git to specify which files and directories to ignore.
├── .metadata
├── README.md                       - Documentation file providing information about the project.
├── analysis_options.yaml           - Configuration file for Dart analysis tools.
└── pubspec.yaml                    - Configuration file for dependencies and other metadata related to the Dart package.
```

### Key Features:
- Facial Recognition: Capture attendance by scanning individuals' faces for quick and efficient tracking. 📸
- Real-time Attendance Tracking: Experience the convenience of real-time updates for accurate attendance data. 🔄
- User Management: Add, edit, and manage user roles, whether they are admins or students. 👥
- Notifications: Receive automatic alerts for important occurrences, keeping users informed. 🚀

### Technology Stack:
- Frontend: Developed using Flutter for a seamless cross-platform experience on iOS and Android smartphones. 📱
- Backend: Built with Flask/Python to handle the server-side logic and facilitate communication with the frontend. 🐍
- Database: Utilizes SQLite for efficient data storage and retrieval. 🗃️
- Facial Recognition: Leverages Python Free Library for implementing facial recognition capabilities. 👤
- Cloud Hosting: Hosted on PythonAnywhere.com for reliable and scalable cloud hosting. ☁️

### Security and Privacy:
FaceTap prioritizes data security and privacy with industry-standard measures:
- Secure Authentication and Authorization: Ensures that only authorized users have access to sensitive information. 🔐
- Strict Data Access Controls: Implements controls to manage and restrict access to data based on user roles. 🛡️
- Compliance: Adheres to GDPR and other relevant data privacy regulations to protect user information. 🌐

### How to Get Started:
1. Download FaceTap on your iOS or Android smartphone. 📲
2. Grant necessary permissions for camera and location. 📷📍
3. Choose your role as a student or teacher. 👩‍🏫👨‍🎓
4. Enjoy the convenience of efficient attendance tracking through facial recognition. ✨
