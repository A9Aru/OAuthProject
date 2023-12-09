# OAuthProject
Clone the repository using git clone https://github.com/A9Aru/OAuthProject.git

## Flutter
Setup Flutter using the following link: https://docs.flutter.dev/get-started/install

Use flutter doctor to get a summary of the dependencies.

This is what you should be expecting after a proper installation of everything:

[✓] Flutter (Channel stable, 3.16.3, on macOS 14.1.2 23B92 darwin-x64, locale en-IN)

[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)

[✓] Chrome - develop for the web

[✓] Android Studio (version 2023.1)

[✓] VS Code (version 1.84.2)

[✓] Connected device (2 available)

[✓] Network resources

## Firebase
Link your flutter application to Firebase.
The following links will help:

https://firebase.google.com/docs/auth/flutter/start

https://firebase.google.com/docs/flutter/setup?platform=android

https://firebase.google.com/docs/cli#install-cli-mac-linux

## Android Studio
Install and setup Android Studio using the following link: https://developer.android.com/studio/install

Setup the command-line-tools for Android SDK using Android Studio: Android Studio --> More Actions --> SDK Manager --> Android SDK --> SDK Tools --> Android SDK Command-Line-Tools

Running "flutter doctor" would ask you to acccept some android-licenses. Run the following command to fix this:

## Working with the application
Given everything was corrected installed, we can now run our application.
This can be done using either a physical android device connected to your system, or using an emulated device.

### Physical Device: 
To use a physical mobile phone, make sure it is connected using the USB-debugging mode.

Run the command flutter devices, select the correct device and run the command flutter run.

### Emulator Device:
Go to Android Studio --> Virtual Device Manager --> + --> and then create an emulator.

Run flutter emulators to see the list of emulators and flutter emulators --launch <emulator id> to launch the emulator.

Run flutter run to use the application.
