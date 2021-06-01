part of 'pages.dart';

class TextDetector2btn extends StatefulWidget {
  TextDetector2btn({Key key}) : super(key: key);

  @override
  _TextDetector2btnState createState() => _TextDetector2btnState();
}

class _TextDetector2btnState extends State<TextDetector2btn> {
  String text = '';
  File image;
  String _text = '';
  PickedFile _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Detector"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: 200,
                          child:
                              Text("Pick Image", textAlign: TextAlign.center),
                        ),
                        textColor: Colors.blueGrey,
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: getImageGallery

                        // onPressed: getImageGallery,
                        // child: Text('Pick Image'),
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
                        onPressed: getImage),
                    const SizedBox(height: 15),
                    RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: 200,
                          child: Text("Scan For Text",
                              textAlign: TextAlign.center),
                        ),
                        textColor: Colors.blueGrey,
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: scanText),
                    const SizedBox(height: 230),
                    RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: 200,
                          child:
                              Text("Restart Text", textAlign: TextAlign.center),
                        ),
                        textColor: Colors.red,
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          _reset();
                        }),
                    const SizedBox(height: 15),
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
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }

  void _reset() {
    Navigator.pushReplacement(
      this.context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => TextDetector2btn(),
      ),
    );
  }

  Future scanText() async {
    showDialog(
        context: this.context,
        child: Center(
          child: CircularProgressIndicator(),
        ));
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        _text += line.text + '\n';
      }
    }

    Navigator.of(this.context).pop();
    Navigator.of(this.context)
        .push(MaterialPageRoute(builder: (context) => Details(_text)));
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }
//   void setImage(File newImage) {
//     setState(() {
//       image = newImage;
//     });
//   }

//   Future pickImage() async {
//     final file = await ImagePicker().getImage(source: ImageSource.gallery);
//     setImage(File(file.path));
//   }
//
// // Future scanTextGallery() async {
  //   showDialog(
  //       context: context,
  //       child: Center(
  //         child: CircularProgressIndicator(),
  //       ));
  //   final FirebaseVisionImage visionImage =
  //       FirebaseVisionImage.fromFile(File(image.path));
  //   final TextRecognizer textRecognizer =
  //       FirebaseVision.instance.textRecognizer();
  //   final VisionText visionText =
  //       await textRecognizer.processImage(visionImage);

  //   for (TextBlock block in visionText.blocks) {
  //     for (TextLine line in block.lines) {
  //       text += line.text + '\n';
  //     }
  //   }

  //   Navigator.of(context).pop();
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => Details(text)));
  // }
}
