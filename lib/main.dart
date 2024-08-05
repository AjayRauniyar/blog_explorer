// lib/main.dart
import 'package:blog_explorer/screens/blog_list.dart';
import 'package:blog_explorer/services/blogservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_explorer/bloc/blog_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'models/blog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(BlogAdapter());
  await Hive.openBox<Blog>('blogs');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      home: BlocProvider(
        create: (context) => BlogBloc(BlogService()),
        child: BlogListScreen(),
      ),
    );
  }
}
