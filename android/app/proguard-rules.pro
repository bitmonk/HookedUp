# ProGuard rules for permission_handler
-keep class com.baseflow.permissionhandler.** { *; }
-keep class io.flutter.** { *; }
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
# Keep Play Core SplitInstall classes
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }
