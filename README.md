<div align="center">
  <img src="data:image/svg+xml,%3Csvg width='179' height='27' viewBox='0 0 179 27' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M8.0368 11.528H19.1248V17.936H8.0368V11.528ZM8.6128 26H0.116804V0.799998H20.6008V7.208H8.6128V26ZM19.9523 26L30.9683 0.799998H39.3203L50.3363 26H41.5523L33.4163 4.832H36.7283L28.5923 26H19.9523ZM26.5043 21.608L28.6643 15.488H40.2563L42.4163 21.608H26.5043ZM64.6902 26.576C62.6742 26.576 60.8022 26.264 59.0742 25.64C57.3702 24.992 55.8822 24.08 54.6102 22.904C53.3622 21.728 52.3902 20.336 51.6942 18.728C50.9982 17.12 50.6502 15.344 50.6502 13.4C50.6502 11.456 50.9982 9.68 51.6942 8.072C52.3902 6.464 53.3622 5.072 54.6102 3.896C55.8822 2.72 57.3702 1.82 59.0742 1.196C60.8022 0.547999 62.6742 0.223999 64.6902 0.223999C67.1622 0.223999 69.3462 0.655999 71.2422 1.52C73.1622 2.384 74.7462 3.632 75.9942 5.264L70.6302 10.052C69.8862 9.116 69.0582 8.396 68.1462 7.892C67.2582 7.364 66.2502 7.1 65.1222 7.1C64.2342 7.1 63.4302 7.244 62.7102 7.532C61.9902 7.82 61.3662 8.24 60.8382 8.792C60.3342 9.344 59.9382 10.016 59.6502 10.808C59.3622 11.576 59.2182 12.44 59.2182 13.4C59.2182 14.36 59.3622 15.236 59.6502 16.028C59.9382 16.796 60.3342 17.456 60.8382 18.008C61.3662 18.56 61.9902 18.98 62.7102 19.268C63.4302 19.556 64.2342 19.7 65.1222 19.7C66.2502 19.7 67.2582 19.448 68.1462 18.944C69.0582 18.416 69.8862 17.684 70.6302 16.748L75.9942 21.536C74.7462 23.144 73.1622 24.392 71.2422 25.28C69.3462 26.144 67.1622 26.576 64.6902 26.576ZM86.5409 10.16H97.7729V16.28H86.5409V10.16ZM87.1169 19.592H99.7169V26H78.7649V0.799998H99.2489V7.208H87.1169V19.592Z' fill='black'/%3E%3Cpath d='M108.777 26V7.388H101.397V0.799998H124.653V7.388H117.273V26H108.777ZM123.176 26L134.192 0.799998H142.544L153.56 26H144.776L136.64 4.832H139.952L131.816 26H123.176ZM129.728 21.608L131.888 15.488H143.48L145.64 21.608H129.728ZM155.233 26V0.799998H167.365C169.717 0.799998 171.745 1.184 173.449 1.952C175.177 2.72 176.509 3.824 177.445 5.264C178.381 6.68 178.849 8.36 178.849 10.304C178.849 12.248 178.381 13.928 177.445 15.344C176.509 16.76 175.177 17.864 173.449 18.656C171.745 19.424 169.717 19.808 167.365 19.808H159.949L163.729 16.172V26H155.233ZM163.729 17.108L159.949 13.256H166.825C168.001 13.256 168.865 12.992 169.417 12.464C169.993 11.936 170.281 11.216 170.281 10.304C170.281 9.392 169.993 8.672 169.417 8.144C168.865 7.616 168.001 7.352 166.825 7.352H159.949L163.729 3.5V17.108Z' fill='%2328D8A1'/%3E%3C/svg%3E" alt="FaceTap Logo" width="179" height="27">
</div>

# FaceTap 📸✨

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
