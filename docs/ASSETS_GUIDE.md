# Assets Guide

This guide explains how to use the app's assets (images, logos, icons) throughout the application.

## Assets Class

All asset paths are centralized in the `Assets` class for easy access and type safety:

```dart
import 'package:outlet_manager/core/utils/assets.dart';
```

## Logos

### Theme-Aware Logos

The app includes logos that automatically adapt to dark/light themes:

```dart
// Logo with white text (for dark backgrounds)
Assets.logoWhite

// Logo with black text (for light backgrounds)
Assets.logoBlack

// Usage with theme detection
final isDark = Theme.of(context).brightness == Brightness.dark;
final logo = isDark ? Assets.logoWhite : Assets.logoBlack;

Image.asset(
  logo,
  height: 100,
  fit: BoxFit.contain,
)
```

### Other Logo Variants

```dart
// Main logo
Assets.logo

// Logo with white background
Assets.logoWhiteBackground

// App icon
Assets.appIcon
```

## Using Logos in App Bar

The `CustomAppBar` has built-in logo support:

```dart
CustomAppBar(
  showLogo: true,  // Shows logo instead of title text
  showMenu: true,
)
```

Or in `AppScaffold`:

```dart
AppScaffold(
  title: 'My Screen',  // Used as fallback if logo fails
  showLogo: true,      // Shows logo in app bar
  showBottomNav: true,
  body: MyContent(),
)
```

## Decorative Images

For screen decorations:

```dart
// Login/Signup decorations
Assets.loginBottom
Assets.signupTop
Assets.mainTop
Assets.mainBottom

// Other screens
Assets.otpVerification
Assets.resetPassword
```

## Feature Icons

Large icons for features/dashboard:

```dart
Assets.dashboard
Assets.cashFlow
Assets.count
Assets.facings
Assets.proposedOrder
Assets.quotation
Assets.routes
Assets.salesOrder
Assets.shelf
Assets.complain
Assets.user
```

## SVG Icons

For social media or special icons:

```dart
Assets.chatIcon
Assets.facebookIcon
Assets.googlePlusIcon
Assets.loginIcon
Assets.signupIcon
Assets.twitterIcon
```

Note: SVG files require the `flutter_svg` package. If not installed, use PNG alternatives.

## Error Handling

Always provide fallback for images:

```dart
Image.asset(
  Assets.logoWhite,
  height: 100,
  errorBuilder: (context, error, stackTrace) {
    // Fallback widget
    return Icon(Icons.store, size: 80);
  },
)
```

## Adding New Assets

1. Add image files to the appropriate folder:
   - `assets/images/` - PNG/JPG images
   - `assets/icons/` - SVG icons

2. Add constant to `Assets` class:
```dart
static const String myNewAsset = '$_imagesPath/my_asset.png';
```

3. Ensure `pubspec.yaml` includes the assets folder:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
```

## Best Practices

1. **Use constants**: Always use `Assets` constants instead of hardcoded paths
2. **Theme awareness**: Use appropriate logo variant for current theme
3. **Error handling**: Provide fallbacks for image loading failures
4. **Optimization**: Use appropriate image sizes and formats
5. **Caching**: Flutter automatically caches asset images

## Example: Complete Logo Implementation

```dart
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          isDark ? Assets.logoWhite : Assets.logoBlack,
          height: 32,
          errorBuilder: (context, error, stackTrace) {
            return Text('Outlet Manager');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.appIcon,
              width: 120,
              height: 120,
            ),
            SizedBox(height: 16),
            Text('Welcome to Outlet Manager'),
          ],
        ),
      ),
    );
  }
}
```
