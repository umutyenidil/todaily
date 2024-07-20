# Todaily

Todaily is a Flutter application built using the Clean Architecture approach. It utilizes Firebase Firestore and Firebase Authentication for data storage and user management.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Todaily is designed to be a simple and efficient task management app. With a clean architecture, it ensures scalability and maintainability.

## Features

- User Authentication
- Task Creation and Management
- Smooth Page Transitions
- Responsive UI

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Project: [Set up Firebase](https://firebase.google.com/docs/flutter/setup)

### Installation

1. Clone the repository
   ```sh
   git clone https://github.com/yourusername/todaily.git
   ```

2. Navigate to the project directory
     ```sh
   cd todaily
   ```

3. Install dependencies
    ```
    flutter pub get
    ```
4.	Set up Firebase
      -	Add your google-services.json file to the android/app directory.
      -	Add your GoogleService-Info.plist file to the ios/Runner directory.

5. To run the app on an emulator or physical device, use:
    ```
    flutter run
    ```

### Dependencies
	•	Flutter SDK: >=3.4.0 <4.0.0
	•	cupertino_icons
	•	flutter_svg
	•	iconsax
	•	smooth_page_indicator
	•	provider
	•	shared_preferences
	•	equatable
	•	dartz
	•	flutter_bloc
	•	get_it
	•	lottie
	•	intl
	•	flutter_staggered_grid_view
	•	firebase_core
	•	cloud_firestore
	•	firebase_auth

### Architecture

The application follows the principles of Clean Architecture, which divides the project into three main layers:

	1.	Presentation Layer: Contains the UI code.
	2.	Domain Layer: Contains business logic and entities.
	3.	Data Layer: Contains data sources and repositories.