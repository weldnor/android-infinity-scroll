import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:infinity_scroll/redux/middleware.dart';
import 'package:infinity_scroll/redux/reducers.dart';
import 'package:infinity_scroll/redux/state.dart';
import 'package:infinity_scroll/widget/main_page.dart';
import 'package:redux/redux.dart';

void main() {
  final store =
      Store<AppState>(appReducer, middleware: [ApiMiddleware(), LoggerMiddleware()], initialState: const AppState());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
