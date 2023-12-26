# facetap

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Application structure

                    
```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```
### Key Features:
Facial Recognition: Capture attendance by scanning individuals' faces for quick and efficient tracking.

Real-time Attendance Tracking: Experience the convenience of real-time updates for accurate attendance data.

User Management: Add, edit, and manage user roles, whether they are admins or students.

Notifications: Receive automatic alerts for important occurrences, keeping users informed.

### Technology Stack:
Frontend: Developed using Flutter for a seamless cross-platform experience on iOS and Android smartphones.

Backend: Built with Flask/Python to handle the server-side logic and facilitate communication with the frontend.

Database: Utilizes SQLite for efficient data storage and retrieval.

Facial Recognition: Leverages Python Free Library for implementing facial recognition capabilities.

Cloud Hosting: Hosted on PythonAnywhere.com for reliable and scalable cloud hosting.

### Security and Privacy:
FaceTap prioritizes data security and privacy with industry-standard measures:

Secure Authentication and Authorization: Ensures that only authorized users have access to sensitive information.

Strict Data Access Controls: Implements controls to manage and restrict access to data based on user roles.

Compliance: Adheres to GDPR and other relevant data privacy regulations to protect user information.

### How to Get Started:
1. Download FaceTap on your iOS or Android smartphone.
2. Grant necessary permissions for camera and location.
3. Choose your role as a student or teacher.
4. Enjoy the convenience of efficient attendance tracking through facial recognition.
