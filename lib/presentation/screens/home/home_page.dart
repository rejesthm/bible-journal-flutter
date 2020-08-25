import 'package:bible_journal/presentation/bloc/bloc/home_bloc.dart';
import 'package:bible_journal/presentation/screens/home/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dependency_injection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: buildBody(context)),
    );
  }

  Widget buildBody(context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: HomeBody(),
    );
  }
}
