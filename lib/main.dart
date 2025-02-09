// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:http/http.dart' as http;
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Image Upload to Server
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
// //
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   File? selectedImage;
// //   String? message = "";
// //
// //   uploadImage(){
// //     final request = http.MultipartRequest("POST", Uri.parse("https://1d9f-202-129-240-29.ngrok-free.app/upload"));
// //
// //     final headers = {"Content-type": "multipart/form-data"}
// //
// //     request.files.add(
// //       http.Multipart('image',
// //       selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
// //       filename: selectedImage!.path.split("/").last)
// //     );
// //     request.headers.addAll(headers);
// //     final response = await request.send();
// //     http.Response res = await  http.Response.fromStream(response);
// //     final resJson = jsonDecode(res.body);
// //     message = resJson['message'];
// //     setState(() {));
// //   }
// //
// //
// //   Future getImage() async {
// //     final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
// //     selectedImage = File(pickedImage!.path);
// //     setState(() {});
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // TRY THIS: Try changing the color here to a specific color (to
// //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //         // change color while the other colors stay the same.
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           //
// //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //           // action in the IDE, or press "p" in the console), to see the
// //           // wireframe for each widget.
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //            selectedImage == null ? Text("Please pick a Image to upload")
// //                : Image.file(selectedImage!)
// //            TextButton.icon(style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
// //                  onPressed: uploadImage,icon:Icon(Icons.upload_file,color: Colors.white),
// //                  label: Text("Upload", style: TextStyle(color: Colors.white,)))
// //
// //
// //       ),
// //     floatingActionButton: FloatingActionButton(onPressed: getImage, child: Icon(Icons.add_a_photo),),
// //
// //
// //
// //     );
// //   }
// // }
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Image Upload to Server'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   File? selectedImage;
//   String? message = "";
//
//   Future<void> uploadImage() async {
//     if (selectedImage == null) return;
//
//     var request = http.MultipartRequest(
//       "POST",
//       Uri.parse(" https://773d-202-129-240-29.ngrok-free.app"),
//     );
//
//     request.headers.addAll({"Content-Type": "multipart/form-data"});
//
//     request.files.add(
//       await http.MultipartFile.fromPath('image', selectedImage!.path),
//     );
//
//     var response = await request.send();
//     var res = await http.Response.fromStream(response);
//     var resJson = jsonDecode(res.body);
//
//     setState(() {
//       message = resJson['message'];
//     });
//   }
//
//   Future<void> getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             selectedImage == null
//                 ? const Text("Please pick an image to upload")
//                 : Image.file(selectedImage!),
//             const SizedBox(height: 20),
//             TextButton.icon(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue),
//               ),
//               onPressed: uploadImage,
//               icon: const Icon(Icons.upload_file, color: Colors.white),
//               label: const Text("Upload", style: TextStyle(color: Colors.white)),
//             ),
//             const SizedBox(height: 10),
//             Text(message ?? "", style: const TextStyle(color: Colors.green)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart'; // For kIsWeb
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Upload to Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Image Upload to Server'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   File? selectedImage;
//   Uint8List? webImage;  // For Web
//   String? message = "";
//
//   Future<void> uploadImage() async {
//     if (kIsWeb && webImage == null) return;
//     if (!kIsWeb && selectedImage == null) return;
//
//     var request = http.MultipartRequest(
//       "POST",
//       Uri.parse("https://a879-202-129-240-29.ngrok-free.app"),  // Ensure the correct endpoint
//     );
//
//     request.headers.addAll({"Content-Type": "multipart/form-data"});
//
//     if (kIsWeb) {
//       // For Web
//       request.files.add(
//         http.MultipartFile.fromBytes('image', webImage!, filename: 'upload.png'),
//       );
//     } else {
//       // For Mobile/Desktop
//       request.files.add(
//         await http.MultipartFile.fromPath('image', selectedImage!.path),
//       );
//     }
//
//     var response = await request.send();
//     var res = await http.Response.fromStream(response);
//     var resJson = jsonDecode(res.body);
//
//     setState(() {
//       message = resJson['message'];
//     });
//   }
//
//   Future<void> getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       if (kIsWeb) {
//         // For Web: Read as bytes
//         final bytes = await pickedFile.readAsBytes();
//         setState(() {
//           webImage = bytes;
//         });
//       } else {
//         // For Mobile/Desktop: Read as file
//         setState(() {
//           selectedImage = File(pickedFile.path);
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (kIsWeb)
//               webImage == null
//                   ? const Text("Please pick an image to upload")
//                   : Image.memory(webImage!)
//             else
//               selectedImage == null
//                   ? const Text("Please pick an image to upload")
//                   : Image.file(selectedImage!),
//             const SizedBox(height: 20),
//             TextButton.icon(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue),
//               ),
//               onPressed: uploadImage,
//               icon: const Icon(Icons.upload_file, color: Colors.white),
//               label: const Text("Upload", style: TextStyle(color: Colors.white)),
//             ),
//             const SizedBox(height: 10),
//             Text(message ?? "", style: const TextStyle(color: Colors.green)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Upload to Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Image Upload to Server'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   File? selectedImage;
//   Uint8List? webImage;
//   String? message = "";
//
//   Future<void> uploadImage() async {
//     if (kIsWeb && webImage == null) return;
//     if (!kIsWeb && selectedImage == null) return;
//
//     var request = http.MultipartRequest(
//       "POST",
//       Uri.parse("https://0e60-202-129-240-29.ngrok-free.app"),
//     );
//
//     request.headers.addAll({"Content-Type": "multipart/form-data"});
//
//     if (kIsWeb) {
//       request.files.add(
//         http.MultipartFile.fromBytes('image', webImage!, filename: 'upload.png'),
//       );
//     } else {
//       request.files.add(
//         await http.MultipartFile.fromPath('image', selectedImage!.path),
//       );
//     }
//
//     var response = await request.send();
//     var res = await http.Response.fromStream(response);
//     var resJson = jsonDecode(res.body);
//
//     setState(() {
//       message = resJson['message'];
//     });
//   }
//
//   Future<void> getImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//
//     if (pickedFile != null) {
//       if (kIsWeb) {
//         final bytes = await pickedFile.readAsBytes();
//         setState(() {
//           webImage = bytes;
//         });
//       } else {
//         setState(() {
//           selectedImage = File(pickedFile.path);
//         });
//       }
//     }
//   }
//
//   void showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Choose Image Source"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               getImage(ImageSource.camera); // Capture from Camera
//             },
//             child: const Text("Camera"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               getImage(ImageSource.gallery); // Pick from Gallery
//             },
//             child: const Text("Gallery"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (kIsWeb)
//               webImage == null
//                   ? const Text("Please pick an image to upload")
//                   : Image.memory(webImage!)
//             else
//               selectedImage == null
//                   ? const Text("Please pick an image to upload")
//                   : Image.file(selectedImage!),
//             const SizedBox(height: 20),
//             TextButton.icon(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue),
//               ),
//               onPressed: uploadImage,
//               icon: const Icon(Icons.upload_file, color: Colors.white),
//               label: const Text("Upload", style: TextStyle(color: Colors.white)),
//             ),
//             const SizedBox(height: 10),
//             Text(message ?? "", style: const TextStyle(color: Colors.green)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showImageSourceDialog,
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }

// main.dart
// main.dart
// pubspec.yaml
/*
dependencies:
  flutter:
    sdk: flutter
  camera: ^0.10.0
  http: ^0.13.0
  path: ^1.8.0
  http_parser: ^4.0.0
*/

// lib/main.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as path;
// import 'package:http_parser/http_parser.dart';
// import 'dart:convert';
//
// List<CameraDescription> cameras = [];
//
// Future<void> main() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//     runApp(MyApp());
//   } on CameraException catch (e) {
//     print('Error initializing camera: $e');
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Camera Upload App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: CameraCaptureScreen(),
//     );
//   }
// }
//
// class CameraCaptureScreen extends StatefulWidget {
//   @override
//   _CameraCaptureScreenState createState() => _CameraCaptureScreenState();
// }
//
// class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   bool _isUploading = false;
//   String _uploadStatus = '';
//   Color _statusColor = Colors.black;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     try {
//       _controller = CameraController(
//         cameras[0],
//         ResolutionPreset.medium,
//         enableAudio: false,
//         imageFormatGroup: ImageFormatGroup.jpeg,
//       );
//       _initializeControllerFuture = _controller.initialize();
//       await _initializeControllerFuture;
//     } on CameraException catch (e) {
//       _setStatus('Error initializing camera: $e', Colors.red);
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _setStatus(String message, Color color) {
//     setState(() {
//       _uploadStatus = message;
//       _statusColor = color;
//     });
//   }
//
//   Future<void> _captureAndUploadImage() async {
//     if (_isUploading) return;
//
//     setState(() {
//       _isUploading = true;
//       _setStatus('Capturing image...', Colors.blue);
//     });
//
//     try {
//       await _initializeControllerFuture;
//       final XFile image = await _controller.takePicture();
//       _setStatus('Uploading image...', Colors.blue);
//       await _uploadImage(image);
//     } catch (e) {
//       _setStatus('Error: $e', Colors.red);
//       print("Error capturing/uploading image: $e");
//     } finally {
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }
//
//   Future<void> _uploadImage(XFile imageFile) async {
//     try {
//       final bytes = await imageFile.readAsBytes();
//
//       String filename = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
//
//       // Replace with your ngrok URL
//       var uri = Uri.parse('https://e0cb-202-129-240-29.ngrok-free.app/upload');
//       print("Uploading to: $uri");
//
//       var request = http.MultipartRequest('POST', uri);
//
//       request.files.add(
//           http.MultipartFile.fromBytes(
//               'image',
//               bytes,
//               filename: filename,
//               contentType: MediaType('image', 'jpeg')
//           )
//       );
//
//       print("Uploading file: $filename");
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");
//
//       if (response.statusCode == 200) {
//         _setStatus('✅ Image uploaded successfully!', Colors.green);
//       } else {
//         _setStatus('❌ Upload failed (${response.statusCode}): ${response.body}', Colors.red);
//       }
//     } catch (e) {
//       _setStatus('❌ Upload error: $e', Colors.red);
//       print("Error uploading image: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Camera Upload')),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<void>(
//               future: _initializeControllerFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return CameraPreview(_controller);
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16),
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Text(
//                   _uploadStatus,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: _statusColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 if (_isUploading)
//                   Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: LinearProgressIndicator(),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _isUploading ? null : _captureAndUploadImage,
//         child: Icon(_isUploading ? Icons.hourglass_empty : Icons.camera_alt),
//         backgroundColor: _isUploading ? Colors.grey : Colors.blue,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }



import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    runApp(MyApp());
  } on CameraException catch (e) {
    print('Error initializing camera: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Language Recognition',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CameraCaptureScreen(),
    );
  }
}

class CameraCaptureScreen extends StatefulWidget {
  @override
  _CameraCaptureScreenState createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isUploading = false;
  String _uploadStatus = '';
  Color _statusColor = Colors.black;
  String _prediction = '';
  final String _serverUrl = 'https://04ad-202-129-240-29.ngrok-free.app';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final camera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      _initializeControllerFuture = _controller.initialize();
      await _initializeControllerFuture;
      if (mounted) setState(() {});
    } on CameraException catch (e) {
      _setStatus('Camera initialization error: ${e.description}', Colors.red);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setStatus(String message, Color color) {
    if (mounted) {
      setState(() {
        _uploadStatus = message;
        _statusColor = color;
      });
    }
  }

  void _setPrediction(String prediction) {
    if (mounted) {
      setState(() {
        _prediction = prediction;
      });
    }
  }

  Future<void> _captureAndUploadImage() async {
    if (_isUploading) return;

    setState(() {
      _isUploading = true;
      _prediction = '';
      _setStatus('Capturing image...', Colors.blue);
    });

    try {
      await _initializeControllerFuture;

      final XFile image = await _controller.takePicture();
      _setStatus('Processing image...', Colors.blue);

      await _uploadImage(image);
    } on CameraException catch (e) {
      _setStatus('Camera error: ${e.description}', Colors.red);
    } catch (e) {
      _setStatus('Error: $e', Colors.red);
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> _uploadImage(XFile imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final uri = Uri.parse('$_serverUrl/predict');

      // Convert image to base64
      final base64Image = base64Encode(bytes);

      // Prepare JSON request
      final Map<String, String> body = {
        'image': base64Image
      };

      // Send request
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Request timed out');
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final jsonResponse = json.decode(response.body);
          if (jsonResponse['status'] == 'success') {
            _setStatus('✅ Sign detected!', Colors.green);
            if (jsonResponse['data'] != null && jsonResponse['data']['prediction'] != null) {
              _setPrediction('Predicted Sign: ${jsonResponse['data']['prediction']}');
            } else {
              _setPrediction('Prediction received');
            }
          } else {
            _setStatus('❌ ${jsonResponse['message'] ?? 'Unknown error'}', Colors.red);
          }
        } on FormatException catch (_) {
          _setStatus('❌ Invalid response format', Colors.red);
        }
      } else if (response.statusCode == 415) {
        _setStatus('❌ Server error: Unsupported media type. Please check image format.', Colors.red);
      } else if (response.statusCode == 413) {
        _setStatus('❌ Image file too large. Please use a smaller image.', Colors.red);
      } else if (response.statusCode >= 500) {
        _setStatus('❌ Server error. Please try again later.', Colors.red);
      } else {
        _setStatus('❌ Error (${response.statusCode}): ${response.body}', Colors.red);
      }
    } on TimeoutException {
      _setStatus('❌ Request timed out. Please try again.', Colors.red);
    } on SocketException {
      _setStatus('❌ Network error. Please check your connection.', Colors.red);
    } catch (e) {
      _setStatus('❌ Upload error: $e', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language Recognition'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: double.infinity,
                    child: CameraPreview(_controller),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _uploadStatus,
                  style: TextStyle(
                    fontSize: 16,
                    color: _statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (_prediction.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      _prediction,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (_isUploading)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isUploading ? null : _captureAndUploadImage,
        child: Icon(_isUploading ? Icons.hourglass_empty : Icons.camera_alt),
        backgroundColor: _isUploading ? Colors.grey : Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}