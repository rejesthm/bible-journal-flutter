import 'package:bible_journal/core/utils/routes/routes_list.dart';
import 'package:bible_journal/presentation/bloc/splash/splash_bloc.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is JournalsOnLoad) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed(HOME_ROUTE);
          });
        }
        if (state is SplashInitial) {
          _onLoad();
        }

        return Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HeaderTextWidget(
                title: "Bible Journal",
                fontSize: 24,
              )
            ],
          ),
        );
      },
    );
  }

  void _onLoad() async {
    BlocProvider.of<SplashBloc>(context).add(
      AppOnload(),
    );
  }
}
