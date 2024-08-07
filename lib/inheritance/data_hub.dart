import 'package:flutter/material.dart';
import 'package:quicorder/inheritance/core_state.dart';

import '../models/user_model.dart';

class DataState extends StatefulWidget {
  final Widget? child;

  const DataState({
    Key? key,
    @required this.child,
  }) : super(key: key);

  @override
  State<DataState> createState() => _DataStateState();
}

class _DataStateState extends State<DataState> {
  CoreState coreState = CoreState();


  void setUserModel(UserModel userModel) {
    final newState = coreState.copy(
      user: userModel,
      // yourLocationString: desc,
    );
    setState(() {
      coreState = newState;
    });
  }





  @override
  Widget build(BuildContext context) {
    return DataInheritance(
      child: widget.child!,
      coreState: coreState,
      stateWidget: this,
    );
  }
}

class DataInheritance extends InheritedWidget {
  final CoreState? coreState;
  final _DataStateState? stateWidget;

  const DataInheritance({
    Key? key,
    @required Widget? child,
    @required this.coreState,
    @required this.stateWidget,
  }) : super(key: key, child: child ?? const Placeholder());

  static _DataStateState? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DataInheritance>()
      ?.stateWidget;

  @override
  bool updateShouldNotify(DataInheritance old) {
    return old.coreState != coreState;
  }
}