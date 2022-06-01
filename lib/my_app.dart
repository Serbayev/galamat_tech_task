import 'package:flutter/material.dart';
import 'package:galamat_tech_task/pages/main_page.dart';
import 'package:galamat_tech_task/repository/images_repository.dart';
import 'package:galamat_tech_task/service/images_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MainPage(repository: ImagesRepository(ImagesService())),
    );
  }
}
