import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galamat_tech_task/bloc/images_cubit.dart';
import 'package:galamat_tech_task/repository/images_repository.dart';
import 'package:galamat_tech_task/widgets/default_layout.dart';
import 'package:galamat_tech_task/widgets/images_grid.dart';

class MainPage extends StatelessWidget {
  final ImagesRepository repository;

  const MainPage({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Photo list',
      child: BlocProvider(
        create: (context) => ImagesCubit(repository),
        child: const ImagesGrid(),
      ),
    );
  }
}
