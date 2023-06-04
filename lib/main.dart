import 'package:expenser_113/constants.dart';
import 'package:expenser_113/data_provider/db_helper.dart';
import 'package:expenser_113/provider/app_provider.dart';
import 'package:expenser_113/screen/add_expense/add_expense_page.dart';
import 'package:expenser_113/screen/home/bloc/cat/cat_bloc.dart';
import 'package:expenser_113/screen/home/bloc/expense/expense_bloc.dart';
import 'package:expenser_113/screen/home/home_page.dart';
import 'package:expenser_113/screen/home/repo/expense_repo.dart';
import 'package:expenser_113/screen/user_onboard/login/login_page.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  var expenseRepo = ExpenseRepo(dbHelper: DbHelper());


  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ExpenseBloc(repo: expenseRepo)),
        BlocProvider(create: (_) => CatBloc(repo: expenseRepo))
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (ctx, provider, child) {
      return MaterialApp(
        title: Constants.APPNAME,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme(),
        theme: AppTheme.lightTheme(),
        themeMode: provider.getThemeMode() ? ThemeMode.dark : ThemeMode.light,
        home: AddExpensePage(),
      );
    });
  }
}
