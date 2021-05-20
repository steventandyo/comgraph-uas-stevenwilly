part of 'pages.dart';

class TextDetector extends StatefulWidget {
  @override
  _TextDetectorState createState() => _TextDetectorState();
}

class _TextDetectorState extends State<TextDetector> {
  @override
  String _text = '';
  PickedFile _image;
  final picker = ImagePicker();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text('Deliver features faster'),
              Text('Craft beautiful UIs'),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: const FlutterLogo(),
                ),
              ),
            ],
          )),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text('Text Recognition'),
  //         actions: [
  //           FlatButton(
  //             onPressed: scanText,
  //             child: Text(
  //               'Scan',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           )
  //         ],
  //       ),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed: getImage,
  //         child: Icon(Icons.add_a_photo),
  //       ),
  //       body: Container(
  //         height: double.infinity,
  //         width: double.infinity,
  //         child: _image != null
  //             ? Image.file(
  //                 File(_image.path),
  //                 fit: BoxFit.fitWidth,
  //               )
  //             : Container(),
  //       ));
  // }

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
}
