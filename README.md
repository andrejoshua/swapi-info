# SwapiInfo application

**SwapiInfo** is an Flutter hybrid application with Clean Architecture approach (or close to it).
This application is should be in line with current technology standards.

## Features (Pages)

As the time of writing, the application has 2 pages, first page, which should contain 3d model
selection.
The first page should have OK button, which directs the app to second page, consisted of tab bar of
single 3d model section and profile section

## Prerequisites

Before working on this project, there are some configurations you need to do

1. Checkout the repository
2. You are now set to work on this project
3. Before running this project, ensure
   to [install Flutter SDK](https://docs.flutter.dev/get-started/install). Also remember to add the
   SDK to the environment system.
4. After Flutter SDK has been installed, try running `flutter doctor`, try to complete all of the
   actions by either:
    - Installing Android SDK
    - Installing Xcode
5. After all of the actions are done, try running `flutter pub get` in order to fetch all of the
   libraries
6. Try running the app by running `flutter run`. If there are problems showing up, refer
   to [Flutter application guide](https://appmaking.com/run-flutter-apps-on-android-device/)

## Architecture

This architecture mostly follows the mix of [this](https://github.com/andrejoshua/alphavantageapp)
and [this](https://github.com/andrejoshua/covid-apps). See those links for detailed explanation
about Clean Architecture.

There are few additional points i will explain given the picture:

* The architecture used is based on task, which requires additional navigation and API call
* The API call uses Dio, and the API response will be later converted into
  Dart Class
* The Response model class should reflect what API provides
* The Domain model class should reflect what is shown in UI
* The data is carried through **Reactive Programming**, which will be passed to MobX observable in
  ViewModel

## Project Libraries

* [Flutter 3.13.1](https://docs.flutter.dev/release/release-notes/release-notes-3.13.0)
* [RxDart](https://pub.dev/packages/rxdart)
* [GetIt](https://pub.dev/packages/get_it)
* [Freezed](https://pub.dev/packages/freezed)
* [Dio](https://pub.dev/packages/dio)
* [Mockito](https://pub.dev/packages/mockito)

## Notes

- RxDart relies heavily on using `Stream<T>` since the library does not introduce `Observable`
  classes as RxKotlin provided (per this documentation is written). So we
  use [rxdart_ext](https://pub.dev/packages/rxdart_ext) as the library provides `Single` class that
  we can rely to pipe the data.
- This project relies on [build_runner](https://dart.dev/tools/build_runner) library. So, for every
  changes that involve annotation, be
  sure to run `flutter pub run build_runner build --delete-conflicting-outputs` and wait
- You will see the usage of `freezed` in **all of** data classes. The `freezed` annotation ensures
  that the object should not be modified unless necessary. The prevention was needed to persist the
  object, retaining the source and truth of data. If there are any changes, those need to be done in
  ViewModel. Once you send or receive the data to lower layer (API/local storage), the data needs to
  be persistent.

Issues found:

* No issue found as of 22 September 2023
