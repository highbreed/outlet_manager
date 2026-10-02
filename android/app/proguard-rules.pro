## flutter_local_notifications / Gson rules
#
# flutter_local_notifications uses Gson (via a TypeToken<List<...>>(){}
# anonymous subclass) to persist/reload scheduled notifications across app
# restarts. R8's default shrinking strips the generic signature that Gson
# needs to reconstruct that type at runtime, which doesn't show up as a
# build-time error — it only surfaces as a production crash the first time
# the plugin touches its notification cache (observed in the field:
# PlatformException "TypeToken must be created with a type argument" from
# FlutterLocalNotificationsPlugin.loadScheduledNotifications, triggered via
# cancelNotification). These are the rules the plugin's own maintainers
# ship in their example app's proguard-rules.pro — the plugin's AAR does
# not bundle them as consumer rules itself, so every app using it needs to
# add them explicitly.
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**

-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

-keep,allowobfuscation,allowshrinking class com.google.gson.reflect.TypeToken
-keep,allowobfuscation,allowshrinking class * extends com.google.gson.reflect.TypeToken
