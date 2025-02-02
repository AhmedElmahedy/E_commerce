import 'package:e_commerc/features/main_layout/home/cubit/home_tab_view_model.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/core/my_bloc_observer.dart';
import 'core/core/routes_manager/route_generator.dart';
import 'core/core/routes_manager/routes.dart';
import 'domain/di/di.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeTabViewModel>(
      create: (context) => getIt<HomeTabViewModel>(),
    ),
    BlocProvider<ProductsViewModel>(
      create: (context) => getIt<ProductsViewModel>(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
