# Flutter Project

A comprehensive Flutter application with a robust structure, including user authentication, data management, and a variety of features.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Project Structure](#project-structure)
4. [Setup and Installation](#setup-and-installation)
5. [Usage](#usage)
6. [Testing](#testing)
7. [Contributing](#contributing)
8. [License](#license)

## Introduction

This Flutter project is designed to provide a rich user experience with features like user authentication, product management, order tracking, and analytics. It uses modern Flutter practices and architectural patterns to ensure a maintainable and scalable codebase.

## Features

### Core MLM Features

- **User Management**: Sign up, sign in, and manage user accounts with role-based access and referral tracking.
- **Referral System**: Track and manage user referrals, including referral bonuses and hierarchies.
- **Earnings Management**: View and manage earnings from different sources and calculate commissions.
- **Order Management**: Process, track, and manage orders efficiently.
- **Product Management**: Add, update, and manage products with details and variants.
- **Wholesaler Management**: Manage wholesaler accounts and verify their details.

### Analytics and Reporting

- **Analytics Dashboard**: Analyze key metrics such as user growth, referral success, and sales performance.
- **Custom Reports**: Generate and view detailed reports on earnings, orders, and referrals.

### User Experience

- **Customizable Themes**: Various themes and font options to match brand aesthetics.
- **Responsive Design**: Optimized for different screen sizes and devices to ensure a seamless user experience.

## Project Structure

The project is organized into several key folders:

- **`lib/`**: Contains all the Dart code for the application.
  - **`data/`**: Manages data sources, models, and repositories.
  - **`domain/`**: Defines entities, repositories, and use cases.
  - **`presentation/`**: Contains BLoC implementations, pages, and widgets.
  - **`utils/`**: Utility classes and constants.
  - **`external/`**: Configuration files like `routes.dart` and `main.dart`.

- **`assets/`**: Contains images and fonts used in the application.

- **`test/`**: Includes unit and integration tests.

## Setup and Installation

### Prerequisites

- Flutter SDK
- Dart SDK

### Steps to Set Up the Project

1. **Clone the Repository**

   ```bash
   git clone https://github.com/AbdallahRahams/mlm_mobile_app.git
   ```

2. **Navigate to the Project Directory (If you are not in the root directory)**

   ```bash
   cd mlm_mobile_app
   ```

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the Application**

   ```bash
   flutter run
   ```

## Usage

### Running the App

To run the application on an emulator or physical device:

```bash
flutter run
```

### Building the App

To build the application for release:

- **Android**

  ```bash
  flutter build apk
  ```

- **iOS**

  Make sure you have Xcode installed and configured. Then run:

  ```bash
  flutter build ios
  ```

  To build the app for a specific simulator or device, you may need to open the iOS project in Xcode:

  ```bash
  open ios/Runner.xcworkspace
  ```

  From Xcode, you can select your target device or simulator and build the app.

## Testing

### Running Unit Tests

To run unit tests:

```bash
flutter test test/unit_tests/
```

### Running Integration Tests

To run integration tests:

```bash
flutter test integration_tests/
```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

© 2024 African Digital Marketing Agency. All rights reserved.

This project is proprietary and for the exclusive use of African Digital Marketing Agency. Unauthorized use, distribution, or duplication of this software is prohibited.

---

Feel free to adjust any details or add additional sections as needed!
