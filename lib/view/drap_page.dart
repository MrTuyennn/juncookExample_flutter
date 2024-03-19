import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DrapPage extends StatefulWidget {
  const DrapPage({Key? key}) : super(key: key);

  @override
  State<DrapPage> createState() => _DrapPageState();
}

class _DrapPageState extends State<DrapPage> {
  GlobalKey key = GlobalKey();

  String dragDirection = '';
  double startDXPoint = 50.0;
  double startDYPoint = 50.0;
  double? dXPoint = 0.0;
  double? dYPoint = 0.0;
  double? velocity = 0.0;

  double? screenW = 0.0;
  double? screenH = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "HORIZONTAL";
      startDXPoint = details.globalPosition.dx.floorToDouble();
      startDYPoint = details.globalPosition.dy.floorToDouble();
    });
  }

  /// Track starting point of a vertical gesture
  void _onVerticalDragStartHandler(DragStartDetails details) {
    setState(() {
      dragDirection = "VERTICAL";
      startDXPoint = details.globalPosition.dx.floorToDouble();
      startDYPoint = details.globalPosition.dy.floorToDouble();
    });
  }

  void _onDragUpdateHandler(DragUpdateDetails details) {
    screenW = MediaQuery.of(context).size.width;
    print("=======> $screenW");
    if (details.globalPosition.dx == (screenW! - 100)) {
      print("object");
      setState(() {
        startDXPoint = screenW! - 100;
      });
    }
    print(details.globalPosition);
    setState(() {
      dragDirection = "UPDATING";
      startDXPoint = details.globalPosition.dx.floorToDouble();
      startDYPoint = details.globalPosition.dy.floorToDouble();
    });
  }

  // /// Track current point of a gesture
  // void _onHorizontalDragUpdateHandler(DragUpdateDetails details) {
  //   setState(() {
  //     dragDirection = "HORIZONTAL UPDATING";
  //     dXPoint = details.globalPosition.dx.floorToDouble();
  //     dYPoint = details.globalPosition.dy.floorToDouble();
  //     velocity = 0.0;
  //   });
  // }

  // /// Track current point of a gesture
  // void _onVerticalDragUpdateHandler(DragUpdateDetails details) {
  //   setState(() {
  //     dragDirection = "VERTICAL UPDATING";
  //     dXPoint = details.globalPosition.dx.floorToDouble();
  //     dYPoint = details.globalPosition.dy.floorToDouble();
  //     velocity = 0.0;
  //   });
  // }

  /// What should be done at the end of the gesture ?
  void _onDragEnd(DragEndDetails details) {
    double result = details.velocity.pixelsPerSecond.dx.abs().floorToDouble();
    setState(() {
      velocity = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStartHandler,
        onVerticalDragStart: _onVerticalDragStartHandler,
        onHorizontalDragUpdate: _onDragUpdateHandler,
        onVerticalDragUpdate: _onDragUpdateHandler,
        onHorizontalDragEnd: _onDragEnd,
        onVerticalDragEnd: _onDragEnd,
        dragStartBehavior: DragStartBehavior.start, // default
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("oek!");
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
                left: startDXPoint.clamp(
                    0, MediaQuery.of(context).size.width - 100),
                top: startDYPoint.clamp(
                    0, MediaQuery.of(context).size.height - 100),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Draggable',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
