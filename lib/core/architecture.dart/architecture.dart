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

abstract class BibleJournalUseCase {}
