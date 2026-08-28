/// Permission types used in the app
enum AppPermissionType {
  /// Location permission for tracking user location
  location,

  /// Camera permission for taking photos
  camera,

  /// Storage permission for saving files
  storage,

  /// Notification permission for showing notifications
  notification,

  /// Photo library access for selecting images
  photos,
}

/// Feature permissions that can be granted/denied by backend
enum FeaturePermission {
  /// Can view customer information
  viewCustomers,

  /// Can create new orders
  createOrders,

  /// Can modify existing orders
  editOrders,

  /// Can cancel orders
  cancelOrders,

  /// Can view product catalog
  viewProducts,

  /// Can view pricing information
  viewPricing,

  /// Can give discounts
  applyDiscounts,

  /// Can perform stock takes
  performStockTakes,

  /// Can submit complaints
  submitComplaints,

  /// Can view route information
  viewRoutes,

  /// Can deviate from assigned route
  deviateFromRoute,
}

/// Extension to convert feature permission to string
extension FeaturePermissionX on FeaturePermission {
  String get key {
    switch (this) {
      case FeaturePermission.viewCustomers:
        return 'view_customers';
      case FeaturePermission.createOrders:
        return 'create_orders';
      case FeaturePermission.editOrders:
        return 'edit_orders';
      case FeaturePermission.cancelOrders:
        return 'cancel_orders';
      case FeaturePermission.viewProducts:
        return 'view_products';
      case FeaturePermission.viewPricing:
        return 'view_pricing';
      case FeaturePermission.applyDiscounts:
        return 'apply_discounts';
      case FeaturePermission.performStockTakes:
        return 'perform_stock_takes';
      case FeaturePermission.submitComplaints:
        return 'submit_complaints';
      case FeaturePermission.viewRoutes:
        return 'view_routes';
      case FeaturePermission.deviateFromRoute:
        return 'deviate_from_route';
    }
  }

  String get displayName {
    switch (this) {
      case FeaturePermission.viewCustomers:
        return 'View Customers';
      case FeaturePermission.createOrders:
        return 'Create Orders';
      case FeaturePermission.editOrders:
        return 'Edit Orders';
      case FeaturePermission.cancelOrders:
        return 'Cancel Orders';
      case FeaturePermission.viewProducts:
        return 'View Products';
      case FeaturePermission.viewPricing:
        return 'View Pricing';
      case FeaturePermission.applyDiscounts:
        return 'Apply Discounts';
      case FeaturePermission.performStockTakes:
        return 'Perform Stock Takes';
      case FeaturePermission.submitComplaints:
        return 'Submit Complaints';
      case FeaturePermission.viewRoutes:
        return 'View Routes';
      case FeaturePermission.deviateFromRoute:
        return 'Deviate from Route';
    }
  }
}

/// Parse feature permission from string key
FeaturePermission? parseFeaturePermission(String key) {
  return FeaturePermission.values.firstWhere(
    (p) => p.key == key,
    orElse: () => FeaturePermission.viewCustomers, // Default fallback
  );
}
