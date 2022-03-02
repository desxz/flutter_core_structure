import 'package:permission_handler/permission_handler.dart';

// Ask all permissions in Splash Screen
// Then route user to other pages

class PermissionManager {
  static PermissionManager? _instance;
  static PermissionManager get instance =>
      _instance ??= PermissionManager._init();
  PermissionManager._init();

  final permissions = <Permission>[
    Permission.calendar,
    Permission.camera,
    Permission.contacts,
    Permission.location,
    Permission
        .locationAlways, //The locationAlways permission can not be requested directly, the user has to request the locationWhenInUse permission first. Accepting this permission by clicking on the 'Allow While Using App' gives the user the possibility to request the locationAlways permission.
    Permission.locationWhenInUse,
    Permission.mediaLibrary,
    Permission.microphone,
    Permission.phone,
    Permission.photos,
    Permission.photosAddOnly,
    Permission.reminders,
    Permission.sensors,
    Permission.sms,
    Permission.speech,
    Permission.storage,
    Permission.ignoreBatteryOptimizations,
    Permission.notification, // No Dialog
    Permission.accessMediaLocation,
    Permission.activityRecognition,
    Permission.bluetooth, // No Dialog
    Permission.manageExternalStorage, // No Dialog
    Permission.requestInstallPackages,
    Permission.appTrackingTransparency,
    Permission.criticalAlerts,
    Permission.accessNotificationPolicy, // No Dialog
    Permission.bluetoothScan,
    Permission.bluetoothAdvertise,
    Permission.bluetoothConnect,
  ];

  Future<void> requestPermissions() async {
    await permissions.request();
  }
}
