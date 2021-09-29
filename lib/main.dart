import 'package:album/repository/albums_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/injection.dart';
import 'repository/http_client.dart';
import 'view/home_view.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider<AlbumsRepository>(
            create: (_) => AlbumsRepository(
              getIt.get<HttpClient>().init(),
            ),
          ),
        ],
        child: const HomeView(),
      ),
    );
  }
}
