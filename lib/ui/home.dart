part of 'pages.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("PhotoPedia"),
            backgroundColor: Colors.blue,
          ),
          body: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100),
                    Flexible(
                      flex: 2,
                      child: Container(
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //   image: AssetImage("assets/camera.png"),
                          // )),
                          ),
                    ),
                    Flexible(
                        flex: 3,
                        child: Center(
                          child: Column(
                            children: [
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Text Detector",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TextDetector2btn();
                                    // return TextDetector();
                                  }));
                                },
                              ),
                              SizedBox(height: 20),
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Face Detector",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    // return DetailFaceDetector();
                                    return FaceDetector();
                                  }));
                                },
                              ),
                              SizedBox(height: 20),
                              RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 100,
                                  child: Text("Photo Filter",
                                      textAlign: TextAlign.center),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return PhotoFilter();
                                  }));
                                },
                              ),
                              SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                  text: "Enjoy Our Application",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 11),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
        ));
  }
}
