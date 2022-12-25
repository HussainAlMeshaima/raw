# Raw



## flutter sdk

- Flutter (Channel stable, 3.3.9, on macOS 13.0.1 22A400 darwin-arm, locale en-BH)
- Android toolchain - develop for Android devices (Android SDK version 33.0.0)
- Xcode - develop for iOS and macOS (Xcode 14.1)
- Android Studio (version 2021.3)
- IntelliJ IDEA Community Edition (version 2022.3)
- VS Code (version 1.74.1)

## generate

generate required files and dependence's

```
flutter doctor &&
flutter pub get &&
flutter pub run build_runner build --delete-conflicting-outputs
```

to run app run one

```
flutter run --debug
flutter run --profile
flutter run --release
```

## android

### device

- name = pixel 5
- api = 28
