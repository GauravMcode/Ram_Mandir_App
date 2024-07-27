# Ram_Mandir_App

A new Flutter project based on timeline events of Ram Temple. Also a music player playing bhajans of Lord Rama. Along with Localization support for English and Hindi Language.

## Getting Started

This project is a starting point for a Flutter application.

Run **flutter pub get** and then **flutter run** to run the project.

## Stacks:
- **Bloc(cubits)** is used for State Management.
- Bloc Architecture is used.
- **flutter_localization** and **intl** package is used for localization.
- **shared_preferences** for persisting localization state.
- **just_audio** package is used to play audio for music player.

## Localization guide:
- To add new language, create new arb file inside the folder l10n in lib. The file name should be app_{language code}.dart.
- add translation texts in that file
- run  ```flutter pub get ``` to generate localization files
- add new language in  the **AppSettings** widget.

## Challenges faced:
- ensuring Localization of static assets which were list of Events and Music items.For that i defined a method that takes context as parameter
- managing localization state and persisting it locally on device. For this, I used Bloc cubits and shared_preferences
- Changing state i.e. app language throughout the app when language changed through settings
- playing audio of bhajans. For that, I used audio_player package

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

