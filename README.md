# cinemapedia

## Getting Started

This project is a starting point for a Flutter application.

# Dev

1. Copy .env.template and rename to .env
2. Change the environment variables. 
```
dart pub run build_runner build
```

# Prod
Para cambiar el nombre de la aplicación:
```
flutter pub run change_app_package_name:main com.xxx.xxx
```

Para cambiar el ícono de la aplicación
```
flutter pub run flutter_launcher_icons
```

Para cambair el splash screen
```
flutter pub run flutter_native_splash:create
```

Android AAB
```
flutter build appbundle