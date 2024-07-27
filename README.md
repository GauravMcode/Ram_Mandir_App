# Ram_Mandir_App

A new Flutter project based on timeline events of Ram Temple. Also a music player playing bhajans of Lord Rama. Along with Localization support for English and Hindi Language.

## Getting Started

This project is a starting point for a Flutter application.

Run **flutter pub get** and then **flutter run** to run the project.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Stacks:
- **Bloc(cubits)** is used for State Management.
- Bloc Architecture is used.
- **flutter_localization** and **intl** package is used for localization,
- **just_audio** package is used to play audio for music player

## Folder Structre:
This Project follows BLoC Architecture Pattern, where code is seperated into :

```
|- Data Layer
|- Bloc Layer
|- Presentation Layer
```
The complete Folder Structe is as follows :

The **lib** folder consists :
```
lib
|- data
|- Bloc
|- presentation
|- config
|- main.dart
```
The **data** contains static data for app and models

```
data
  |- app_data
     |- events.dart
     |- music.dart
  |- models
     |- events.dart
     |- music.dart
```
The **bloc** sub-folder has cubits :
```
bloc
  |- music_cubit.dart
  |- language_cubit.dart
```
The **presentation** sub-folder consists all UI part ; widgets contain refactored and re-usable widgets.

UI part:

```
presentation
   |- pages
     |- home_page.dart
     |- music_page.dart
     |- error_page.dart
   |- widgets
      |- bottom_image.dart
      |- last_page.dart
      |- middle_text_widget.dart
      |- progress_bar.dart
      |- app_settings.dart
       
  
```

