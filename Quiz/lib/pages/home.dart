import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          flexibleSpace: SafeArea(
            child: Icon(
              Icons.photo_camera,
              size: 75.0,
              color: Colors.white70,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color: Colors.lightGreen.shade100,
              height: 75.0,
              width: double.infinity,
              child: Center(
                child: Text('Bottom'),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const OrientationLayoutIconsWidget(),
                Divider(),
                const OrientationLayoutWidget(),
                Divider(),
                const GridViewWidget(),
                Divider(),
                const OrientationBuilderWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 48.0,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 48.0,
              ),
              Icon(
                Icons.brush,
                size: 48.0,
              ),
            ],
          );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            height: 100.0,
            width: 100.0,
            child: Text('Portrait'),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            height: 100.0,
            width: 200.0,
            child: Text('Landscape'),
          );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text(
          "Grid $index",
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
            ? Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                height: 100.0,
                width: 100.0,
                child: Text('Portrait'),
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.lightGreen,
                height: 100.0,
                width: 200.0,
                child: Text('Landscape'),
              );
      },
    );
  }
}
