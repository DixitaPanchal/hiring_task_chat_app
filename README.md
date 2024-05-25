# hiring_task_chat_app

## Introduction

This Flutter project is a chat application integrated with the Stripe payment gateway for seamless and secure payments. The app allows users to chat in real-time and handle payments within the app.

## Features

- Real-time chat functionality
- Secure Stripe payment integration
- User authentication (sign up, login, logout)

## Getting Started

### Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/DixitaPanchal/hiring_task_chat_app.git
    cd hiring_task_chat_app
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Set up Firebase:**
    - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android/iOS app to your Firebase project and follow the configuration steps.
    - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files and place them in the respective directories of your Flutter project.

4. **Set up Stripe:**
    - Create a Stripe account and obtain your API keys from the [Stripe Dashboard](https://dashboard.stripe.com/).
    - Add your Stripe keys to your project. You can store them in a secure way using environment variables or a secure storage solution.

5. **Run the app:**
    ```bash
    flutter run
    ```

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) 2.0 or higher
- A Stripe account for payment processing

### Dependencies
  
  http: ^1.1.2
  flutter_stripe: ^10.1.1
  flutter_dotenv: ^5.0.1
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  firebase_core: ^2.26.0
  firebase_auth: ^4.17.8
  provider: ^6.0.5
  cloud_firestore: ^4.15.8

  ### Bugs

  There are some bugs in the payment gateway. When applied the test mode code, the gateway is having some technical issues. The payment is getting registered in the stripe account, but not successfully.

  This issue is related to the project environment in Android Studio. I have downloaded the latest version of kotlin and gradle versions, still the issue persisted. 

  ## Contact

contact:
Dixita Panchal,
dixitapanchal02@gmail.com.

  
