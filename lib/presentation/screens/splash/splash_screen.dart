import 'package:bible_journal/presentation/bloc/splash/splash_bloc.dart';
import 'package:bible_journal/presentation/screens/splash/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency_injection.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: buildBody(context)),
    );
  }

  Widget buildBody(context) {
    return BlocProvider(
      create: (_) => sl<SplashBloc>(),
      child: SplashBody(),
    );
  }
}
