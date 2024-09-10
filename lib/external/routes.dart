import 'package:flutter/material.dart';
import '../presentation/pages/auth/signin_page.dart';
import '../presentation/pages/auth/signup_page.dart';
import '../presentation/pages/auth/forgot_password_page.dart';
import '../presentation/pages/dashboard/admin_dashboard.dart';
import '../presentation/pages/dashboard/retailer_dashboard.dart';
import '../presentation/pages/dashboard/analytics_dashboard.dart';
import '../presentation/pages/network/network_page.dart';
import '../presentation/pages/network/network_details_page.dart';
import '../presentation/pages/earnings/earnings_page.dart';
import '../presentation/pages/earnings/earnings_details_page.dart';
import '../presentation/pages/referrals/referrals_page.dart';
import '../presentation/pages/referrals/referral_details_page.dart';
import '../presentation/pages/orders/orders_page.dart';
import '../presentation/pages/orders/order_details_page.dart';
import '../presentation/pages/products/products_page.dart';
import '../presentation/pages/products/product_details_page.dart';
import '../presentation/pages/wholesalers/wholesaler_verification_page.dart';
import '../presentation/pages/wholesalers/wholesaler_management_page.dart';
import '../presentation/pages/cart/cart_page.dart';
import '../presentation/pages/settings/settings_page.dart';
import '../presentation/pages/settings/change_password_page.dart';
import '../presentation/pages/settings/contact_details_page.dart';
import '../presentation/pages/settings/product_services_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case '/admin-dashboard':
        return MaterialPageRoute(builder: (_) => AdminDashboard());
      case '/retailer-dashboard':
        return MaterialPageRoute(builder: (_) => RetailerDashboard());
      case '/analytics-dashboard':
        return MaterialPageRoute(builder: (_) => AnalyticsDashboard());
      case '/network':
        return MaterialPageRoute(builder: (_) => NetworkPage());
      case '/network-details':
        return MaterialPageRoute(builder: (_) => NetworkDetailsPage());
      case '/earnings':
        return MaterialPageRoute(builder: (_) => EarningsPage());
      case '/earnings-details':
        return MaterialPageRoute(builder: (_) => EarningsDetailsPage());
      case '/referrals':
        return MaterialPageRoute(builder: (_) => ReferralsPage());
      case '/referral-details':
        return MaterialPageRoute(builder: (_) => ReferralDetailsPage());
      case '/orders':
        return MaterialPageRoute(builder: (_) => OrdersPage());
      case '/order-details':
        return MaterialPageRoute(builder: (_) => OrderDetailsPage());
      case '/products':
        return MaterialPageRoute(builder: (_) => ProductsPage());
      case '/product-details':
        return MaterialPageRoute(builder: (_) => ProductDetailsPage());
      case '/wholesaler-verification':
        return MaterialPageRoute(builder: (_) => WholesalerVerificationPage());
      case '/wholesaler-management':
        return MaterialPageRoute(builder: (_) => WholesalerManagementPage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartPage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/change-password':
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      case '/contact-details':
        return MaterialPageRoute(builder: (_) => ContactDetailsPage());
      case '/product-services':
        return MaterialPageRoute(builder: (_) => ProductServicesPage());
      default:
        return MaterialPageRoute(builder: (_) => SignInPage()); // Default route
    }
  }
}