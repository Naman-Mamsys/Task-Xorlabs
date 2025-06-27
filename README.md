# Customer & Partner Viewer App

This Flutter application displays two vertically stacked lists/tables:
- **Customers** – with name, viewable mobile number, and delete option
- **Partners** – with name, viewable email address, and delete option

## ✨ Features
- Clean UI with a dark theme
- Uses **GetX** for state management
- **Table-level refresh** for Customers and Partners
- Responsive layout using **MediaQuery**
- Reusable components (`ProfileRow`) for clean code

## 🧱 Architecture
Follows a simple clean architecture structure:
```
lib/
├── main.dart
├── src/
│   ├── app.dart
│   ├── core/
│   │   └── environment/env.dart
│   ├── models/
│   │   ├── customer_model.dart
│   │   └── partner_model.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── components/
│   │   └── profile_row.dart
│   └── modules/
│       └── home/
│           ├── home_screen.dart
│           └── home_controller.dart
```


## 📦 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  http: ^0.13.6
  cupertino_icons: ^1.0.6
```

## ✅ iOS Specific
- Add this in `ios/Runner/Info.plist` to allow HTTP:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```
- Ensure you set a development team and bundle ID in Xcode.
- 
---
Built with ❤️ using Flutter & GetX
