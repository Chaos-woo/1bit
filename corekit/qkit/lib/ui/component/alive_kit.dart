import 'package:flutter/material.dart';

/// KeepAlive封装组件
abstract class QAliveStateKit<P extends StatefulWidget> extends State<P>
    with AutomaticKeepAliveClientMixin<P> {

  @override
  bool get wantKeepAlive => true;
}
