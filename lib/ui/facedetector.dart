part of 'pages.dart';

class FaceDetector extends StatefulWidget {
  @override
  _FaceDetectorState createState() => _FaceDetectorState();
}

class _FaceDetectorState extends State<FaceDetector> {
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
              title: Text("Face Detector"),
              backgroundColor: Colors.redAccent,
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      child: Text("Pick Image", textAlign: TextAlign.center),
                    ),
                    textColor: Colors.blueGrey,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FaceDetectorGallery(),
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
                            builder: (context) => FaceDetectorCamera(),
                          ),
                        );
                      }),
                  const SizedBox(height: 200),
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
}
