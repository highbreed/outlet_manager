## Global Widgets Usage Guide

This project includes reusable widgets that can be used across all screens.

### 1. **AppScaffold** - Complete Page Wrapper

Use `AppScaffold` for consistent layout with optional app bar and bottom navigation:

```dart
AppScaffold(
  title: 'My Screen',
  showBottomNav: true,           // Show bottom navigation
  currentNavIndex: 0,            // Current tab index
  showLocationIndicator: true,   // Show location tracking status
  showMenu: true,                // Show menu with Settings/Help/Sign Out
  body: YourContentWidget(),
)
```

### 2. **CustomAppBar** - Standalone App Bar with Menu

Use `CustomAppBar` when you need just the app bar without scaffold. It includes a menu button with:
- User profile info
- Settings
- Help Center
- Sign Out

```dart
Scaffold(
  appBar: CustomAppBar(
    title: 'Custom Title',
    showLogo: true,  // Show logo instead of title text
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
    showLocationIndicator: false,
    showMenu: true,  // Menu button with Settings/Help/Sign Out
  ),
  body: YourContent(),
)
```

**Logo Support**: Set `showLogo: true` to display the app logo in the app bar. The logo automatically adapts to dark/light theme.

### Menu Options

The app bar menu provides:
- **User Info**: Shows current user's name and email
- **Settings**: Navigate to settings page (`/settings`)
- **Help Center**: Navigate to help center (`/help`)
- **Sign Out**: Confirms and logs out the user

### 3. **Toast Notifications**

Show quick feedback messages:

```dart
// Success
context.showSuccessToast('Operation completed!');

// Error
context.showErrorToast('Something went wrong!');

// Warning
context.showWarningToast('Please check your input!');

// Info
context.showInfoToast('Did you know...');

// With custom duration
context.showSuccessToast('Message', duration: Duration(seconds: 5));
```

### 4. **Loading Overlay**

Show/hide full-screen loading indicator:

```dart
// Show loading
context.showLoading(message: 'Processing...');

// Hide loading
context.hideLoading();

// Example with async operation
void saveData() async {
  context.showLoading(message: 'Saving...');
  try {
    await repository.save();
    context.hideLoading();
    context.showSuccessToast('Saved successfully!');
  } catch (e) {
    context.hideLoading();
    context.showErrorToast('Failed to save');
  }
}
```

### 5. **Confirmation Dialog**

Ask for user confirmation:

```dart
// Normal confirmation
final confirmed = await context.showConfirmDialog(
  title: 'Delete Item',
  message: 'Are you sure you want to delete this?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
);

if (confirmed) {
  // User confirmed
}

// Destructive action (red button)
final confirmed = await context.showConfirmDialog(
  title: 'Permanent Delete',
  message: 'This cannot be undone!',
  confirmText: 'Delete Forever',
  isDestructive: true,
);
```

### 6. **Bottom Navigation Bar**

The bottom nav is automatically integrated in `AppScaffold`. Routes:
- Index 0: Home (`/home`)
- Index 1: Outlets (`/outlets`) - TODO
- Index 2: Map (`/map`) - TODO
- Index 3: Profile (`/profile`) - TODO

### Complete Example

```dart
class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'My Screen',
      showBottomNav: true,
      currentNavIndex: 0,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleAction(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your content
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(BuildContext context) async {
    final confirmed = await context.showConfirmDialog(
      title: 'Add Item',
      message: 'Do you want to add this item?',
    );

    if (!confirmed) return;

    context.showLoading(message: 'Adding item...');
    
    try {
      await someAsyncOperation();
      context.hideLoading();
      context.showSuccessToast('Item added successfully!');
    } catch (e) {
      context.hideLoading();
      context.showErrorToast('Failed to add item');
    }
  }
}
```

### Import Statement

```dart
import '../../../core/core.dart'; // or appropriate path
```

All widgets are exported through `core/widgets/widgets.dart` and then through `core/core.dart`.
