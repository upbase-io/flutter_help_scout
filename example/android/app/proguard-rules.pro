# Keep all classes, methods, and fields from the Help Scout Beacon SDK
-keep class com.helpscout.beacon.** { *; }
-keep class com.helpscout.beacon.internal.** { *; }
-keep class com.helpscout.beacon.model.** { *; }
-keep class com.helpscout.beacon.ui.** { *; }

# Keep all methods and fields in 'BeaconConfigApi' (related to NullPointerException)
-keep class com.helpscout.beacon.internal.core.model.BeaconConfigApi {
    *;
}

# Keep Kotlin metadata and annotations (Help Scout SDK might use Kotlin internally)
-keep class kotlin.Metadata { *; }
-keepclassmembers class ** {
    @org.jetbrains.annotations.NotNull *;
}

# Keep classes and methods used in singleton patterns
-keepclassmembers class ** {
    static <fields>;
}

# Prevent removing annotations (such as @Keep)
-keepattributes *Annotation*

# Prevent obfuscation of methods and classes with @Keep annotation
-keep @interface android.support.annotation.Keep
-keepclassmembers class * {
    @android.support.annotation.Keep *;
}

# Flutter-related rules (if using Flutter)
-keep class io.flutter.** { *; }

-keep class com.helpscout.beacon.ui.** { *; }
-keep class com.helpscout.beacon.internal.core.model.BeaconConfigApi.** { *; }
-keep class om.helpscout.beacon.internal.presentation.inject.modules.** { *; }