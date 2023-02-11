import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixel/resourses/app_values.dart';
import 'package:pixel/utilities/routes/routes.dart';
import 'package:pixel/utilities/routes/routes_name.dart';
import 'package:pixel/view_model/api_view_model.dart';
import 'package:pixel/view_model/auth_view_model.dart';
import 'package:pixel/view_model/bottom_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationService()),
          ChangeNotifierProvider(create: (_) => BottomController()),
          ChangeNotifierProvider(create: (_) => ApiProvider())
        ],
        child: MaterialApp(
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: AppValues.appBackgrounColor),
              scaffoldBackgroundColor: const Color(0xFFD7EFDC)),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
