import 'package:e_commerc/core/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import '../../../features/auth.presentation.screens/login/presentation/login_screen.dart';
import '../../../features/auth.presentation.screens/register/presentation/register_screen.dart';
import '../../../features/cart/screens/cart_screen.dart';
import '../../../features/main_layout/main_layout.dart';
import '../../../features/products_screen/presentation/screens/products_screen.dart';
import '../../../features/splash/splash_screen.dart';


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) =>  CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>  MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  ProductsScreen());

      // case Routes.productDetails:
      //   return MaterialPageRoute(builder: (_) =>  ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
