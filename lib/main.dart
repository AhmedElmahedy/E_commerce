import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:e_commerc/features/cart/cubit/cart_view_model.dart';
import 'package:e_commerc/features/main_layout/home/cubit/home_tab_view_model.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'core/core/my_bloc_observer.dart';
import 'core/core/routes_manager/route_generator.dart';
import 'core/core/routes_manager/routes.dart';
import 'domain/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  final app = await getApplicationDocumentsDirectory();
  Hive.init(app.path);
  await HivePreferenceUtil.init();


  var token = await HivePreferenceUtil.getData() ;
  String route ;
  if(token == null  ){
    route = Routes.signInRoute;
  }else{
    route = Routes.mainRoute;
  }



  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeTabViewModel>(
      create: (context) => getIt<HomeTabViewModel>(),
    ),
    BlocProvider<CartViewModel>(
      create: (context) => getIt<CartViewModel>(),
    ),
    BlocProvider<ProductsViewModel>(
      create: (context) => getIt<ProductsViewModel>(),
    ),
  ], child: MyApp(route: route,)));
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});
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
        initialRoute: route,
      ),
    );
  }
}
