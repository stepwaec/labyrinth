import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AppStateContainer extends StatefulWidget {
  // This widget is simply the root of the tree,
  // so it has to have a child!
  final Widget child;
  final List<MaterialColor> _glColours = [Colors.blue, Colors.red, Colors.green,
    Colors.yellow, Colors.orange, Colors.purple, Colors.cyan, Colors.grey];

  final List<String> _glTargets = [
    "001-coffee.png",
    "002-helmet.png",
    "003-cheese.png",
    "004-umbrella.png",
    "005-pretzel.png",
    "006-brain.png",
    "007-broccoli.png",
    "008-lips.png",
    "009-coconut.png",
    "010-salad.png",
    "011-carrot.png",
    "012-avocado.png",
    "013-crown.png",
    "014-mortarboard.png",
    "015-cake.png",
    "016-popcorn.png",
    "017-beer.png",
    "018-candy.png",
    "019-donuts.png",
    "020-pizza.png",
    "021-burger.png",
    "022-strawberry.png",
    "023-watermelon.png",
    "024-sunglasses.png",
    "025-champagne.png",
    "026-chocolate.png",
    "027-cherry.png",
    "028-banana.png",
    "029-engagement-ring.png",
    "030-footprints.png"
  ];

  AppStateContainer({
    @required this.child,
  });

  // This creates a method on the AppState that's just like 'of'
  // On MediaQueries, Theme, etc
  // This is the secret to accessing your AppState all over your app
  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => new _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  // Just padding the state through so we don't have to
  // manipulate it with widget.state.

  List<MaterialColor> getColours() {
    return widget._glColours;
  }

  List<String> getTargets() {
    return widget._glTargets;
  }

  @override
  void initState() {
    // You'll almost certainly want to do some logic
    // in InitState of your AppStateContainer. In this example, we'll eventually
    // write the methods to check the local state
    // for existing users and all that.
    super.initState();
  }

  // So the WidgetTree is actually
  // AppStateContainer --> InheritedStateContainer --> The rest of your app.
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

// This is likely all your InheritedWidget will ever need.
class _InheritedStateContainer extends InheritedWidget {
  // The data is whatever this widget is passing down.
  final _AppStateContainerState data;

  // InheritedWidgets are always just wrappers.
  // So there has to be a child,
  // Although Flutter just knows to build the Widget that's passed to it
  // So you don't have have a build method or anything.
  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a better way to do this, which you'll see later.
  // But basically, Flutter automatically calls this method when any data
  // in this widget is changed.
  // You can use this method to make sure that flutter actually should
  // repaint the tree, or do nothing.
  // It helps with performance.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}