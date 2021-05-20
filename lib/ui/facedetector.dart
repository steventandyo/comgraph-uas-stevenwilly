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
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new AppBar(
              title: Text("Face Detector"),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 100,
                      child: Text("Pick Image", textAlign: TextAlign.center),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
                        width: 100,
                        child: Text("Camera", textAlign: TextAlign.center),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FaceDetectorCamera(),
                          ),
                        );
                      }),
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
