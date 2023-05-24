import 'package:flutter/material.dart';
import 'package:lista/routes/app_routes.dart';
import 'package:lista/views/user_list.dart';
import 'package:provider/provider.dart';
import 'package:lista/provider/users.dart';
import 'package:lista/views/user_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => Users(),
      )
    ],
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => const UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}

