part of 'pages.dart';

class PhotoFilter extends StatefulWidget {
  PhotoFilter({Key key}) : super(key: key);

  @override
  _PhotoFilterState createState() => _PhotoFilterState();
}

class _PhotoFilterState extends State<PhotoFilter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("background/bg3.jpg"), fit: BoxFit.cover)),

        // color: Colors.white,
        child: Column(
          children: <Widget>[
            new AppBar(
              title: Text("PhotoFilter"),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(height: 250),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      child: Text("Gallery", textAlign: TextAlign.center),
                    ),
                    textColor: Colors.blueGrey,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhotoFilterGallery(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  RaisedButton(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        width: 200,
                        child: Text("Camera", textAlign: TextAlign.center),
                      ),
                      textColor: Colors.blueGrey,
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PhotoFilterCamera(),
                          ),
                        );
                      }),
                  const SizedBox(height: 150),
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      child: Text("MAIN MENU", textAlign: TextAlign.center),
                    ),
                    textColor: Colors.white,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MainMenu();
                        // return TextDetector();
                      }));
                    },
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("PhotoFilter"),
  //     ),
  //     body: Container(
  //       color: Colors.white,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           RaisedButton(
  //               padding: EdgeInsets.all(15),
  //               child: Container(
  //                 width: 100,
  //                 child: Text("Gallery", textAlign: TextAlign.center),
  //               ),
  //               textColor: Colors.white,
  //               color: Colors.blue,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).push(
  //                   MaterialPageRoute(
  //                     builder: (context) => PhotoFilterGallery(),
  //                   ),
  //                 );
  //               }),
  //           RaisedButton(
  //               padding: EdgeInsets.all(15),
  //               child: Container(
  //                 width: 100,
  //                 child: Text("Camera", textAlign: TextAlign.center),
  //               ),
  //               textColor: Colors.white,
  //               color: Colors.blue,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).push(
  //                   MaterialPageRoute(
  //                     builder: (context) => PhotoFilterCamera(),
  //                   ),
  //                 );
  //               })
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
