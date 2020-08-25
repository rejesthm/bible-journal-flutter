import 'dart:async';

import 'package:flutter/material.dart';

abstract class BibleJournalApplication extends StatelessWidget {
  final BibleJournalDataInstantiator dataInstantiator;
  BibleJournalApplication(this.dataInstantiator);
}

abstract class BibleJournalDataInstantiator {
  Future<void> init();
}

abstract class BibleJournalModel {}

abstract class BibleJournalMapper<T extends BibleJournalModel> {
  Map<String, dynamic> toMap(T object);

  T fromMap(Map<String, dynamic> map);

  List<T> fromListMap(List<dynamic> listMap) {
    List<T> list = [];
    listMap.forEach(
      (object) {
        list.add(
          fromMap(object),
        );
      },
    );
    return list;
  }
}

abstract class BibleJournalPageState<P extends BibleJournalPresenter>
    extends State<BibleJournalPage> {
  P presenter;

  P createPresenter();

  @override
  void initState() {
    presenter = createPresenter();
    super.initState();
    presenter.onViewInit();
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}

abstract class BibleJournalPage extends StatefulWidget {
  BibleJournalPage({Key key}) : super(key: key);

  @override
  BibleJournalPageState createState();
}

abstract class BibleJournalPresenter {
  BibleJournalPageState bibleJournalPageState;

  BuildContext get context => bibleJournalPageState.context;

  BibleJournalPresenter(this.bibleJournalPageState);

  List<StreamController> get streamControllers;

  void onViewInit();

  void dispose() {
    streamControllers?.map((disposable) {
      disposable.close();
    });
  }

  void notify() {
    bibleJournalPageState.presenter = this;
  }
}

abstract class BibleJournalUseCase {}
