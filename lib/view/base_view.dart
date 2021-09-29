import 'package:album/view-model/base_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseVM> extends StatefulWidget {
  
  final T? vm;
  final Function(T)? onModelReady;
  final Widget Function(BuildContext context, T model, Widget? child)? builder;

  const BaseView({Key? key, 
    this.builder,
    this.vm,
    this.onModelReady,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseVM> extends State<BaseView<T>> {  
  
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.vm!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => widget.vm!,
      child: Consumer<T>(builder: widget.builder!),
    );
  }
}
