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
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: getImageGallery,
            child: Text('Pick Image'),
          ),
          const SizedBox(width: 12),
          RaisedButton(
            onPressed: getImage,
            child: Text('Camera'),
          ),
          RaisedButton(
            onPressed: scanText,
            child: Text('Scan For Text'),
          ),
          const SizedBox(width: 12)
        ],
      );

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

  Future scanText() async {
    showDialog(
        context: context,
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

    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_text)));
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
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
