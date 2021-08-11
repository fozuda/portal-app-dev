import 'package:flutter/material.dart';

class MyCustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyCustomSpace extends StatelessWidget {
  final double width;
  final double height;
  MyCustomSpace({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      width: width,
      height: height,
    ));
  }
}


class MyCustomContainer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/2.0x/'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}



class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/');
    var image = new Image(image: assetsImage, width: 48.0, height: 48.0,);
    return new Container(
      child: image,
    );
  }
}
