// import 'dart:math';
// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late List<Widget> avatars;
//
//   @override
//   void initState() {
//     super.initState();
//
//     avatars = [];
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 300),
//       vsync: this,
//     )..addListener(() {
//       moveCircles();
//     });
//
//     _controller.forward();
//   }
//
//   void moveCircles() {
//     setState(() {
//       avatars = avatars.map((avatar) {
//         double avatarX = (avatar as Positioned).left ?? 0.0;
//         double avatarY = (avatar as Positioned).top ?? 0.0;
//
//         double newX = lerpDouble(avatarX, MediaQuery.of(context).size.width / 2 - 30, _controller.value) ?? 0.0;
//         double newY = lerpDouble(avatarY, MediaQuery.of(context).size.height / 2 - 30, _controller.value) ?? 0.0;
//
//         // Check for collisions and adjust positions
//         double centerUserX = MediaQuery.of(context).size.width / 2 - 30;
//         double centerUserY = MediaQuery.of(context).size.height / 2 - 30;
//
//         double distanceToCenter = sqrt((newX - centerUserX) * (newX - centerUserX) + (newY - centerUserY) * (newY - centerUserY));
//
//         if (distanceToCenter < 60) {
//           // Adjust positions to avoid overlap with the center user
//           newX += (60 - distanceToCenter) * (newX - centerUserX) / distanceToCenter;
//           newY += (60 - distanceToCenter) * (newY - centerUserY) / distanceToCenter;
//         }
//
//         // Check for collisions and adjust positions with other avatars
//         for (Widget otherAvatar in avatars) {
//           if (avatar != otherAvatar) {
//             double otherX = (otherAvatar as Positioned).left ?? 0.0;
//             double otherY = (otherAvatar as Positioned).top ?? 0.0;
//
//             double distance = sqrt((newX - otherX) * (newX - otherX) + (newY - otherY) * (newY - otherY));
//
//             if (distance < 60) {
//               // Adjust positions to avoid overlap with other avatars
//               newX += (60 - distance) * (newX - otherX) / distance;
//               newY += (60 - distance) * (newY - otherY) / distance;
//             }
//           }
//         }
//
//         return Positioned(
//           left: newX,
//           top: newY,
//           child: CircleAvatar(
//             radius: 30,
//             backgroundImage: (avatar.child as CircleAvatar).backgroundImage,
//           ),
//         );
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Simulate API data with 5 different users
//     List<UserData> userDataList = [
//       UserData(id: 1, name: "User 1", image: "assets/1.png"),
//       UserData(id: 2, name: "User 2", image: "assets/2.png"),
//       UserData(id: 3, name: "User 3", image: "assets/3.png"),
//       UserData(id: 4, name: "User 4", image: "assets/4.png"),
//       UserData(id: 5, name: "User 5", image: "assets/1.png"),
//       UserData(id: 5, name: "User 5", image: "assets/2.png"),
//       UserData(id: 5, name: "User 5", image: "assets/3.png"),
//       UserData(id: 5, name: "User 5", image: "assets/4.png"),
//       UserData(id: 5, name: "User 5", image: "assets/1.png"),
//       UserData(id: 5, name: "User 5", image: "assets/2.png"),
//       UserData(id: 5, name: "User 5", image: "assets/3.png"),
//     ];
//
//     // If avatars list is empty, create initial avatars
//     if (avatars.isEmpty) {
//       for (UserData userData in userDataList) {
//         double initX = Random().nextDouble() * MediaQuery.of(context).size.width;
//         double initY = Random().nextDouble() * MediaQuery.of(context).size.height;
//
//         avatars.add(
//           Positioned(
//             left: initX,
//             top: initY,
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(userData.image),
//             ),
//           ),
//         );
//
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Moving Circles'),
//       ),
//       body: Stack(
//         children: [
//           ...avatars,
//           Positioned(
//             left: MediaQuery.of(context).size.width / 2 - 30,
//             top: MediaQuery.of(context).size.height / 2 - 30,
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage('assets/5.png'), // Change to the desired asset path
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// class UserData {
//   final int id;
//   final String name;
//   final String image;
//
//   UserData({required this.id, required this.name, required this.image});
// }
//
// void main() {
//   runApp(MaterialApp(home: MyScreen()));
// }
//
//
//
//
//
//
//
//
//
//
// import 'dart:math';
// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late List<Widget> avatars;
//
//   @override
//   void initState() {
//     super.initState();
//
//     avatars = [];
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 50),
//       vsync: this,
//     )..addListener(() {
//       moveCircles();
//     });
//
//     _controller.forward();
//   }
//
//   void moveCircles() {
//     setState(() {
//       avatars = avatars.map((avatar) {
//         double avatarX = (avatar as Positioned).left ?? 0.0;
//         double avatarY = (avatar as Positioned).top ?? 0.0;
//
//         double newX = lerpDouble(avatarX, MediaQuery.of(context).size.width / 2 - 30, _controller.value) ?? 0.0;
//         double newY = lerpDouble(avatarY, MediaQuery.of(context).size.height / 2 - 30, _controller.value) ?? 0.0;
//
//         // Check for collisions and adjust positions
//         double centerUserX = MediaQuery.of(context).size.width / 2 - 30;
//         double centerUserY = MediaQuery.of(context).size.height / 2 - 30;
//
//         double distanceToCenter = sqrt((newX - centerUserX) * (newX - centerUserX) + (newY - centerUserY) * (newY - centerUserY));
//
//         if (distanceToCenter < 60) {
//           // Adjust positions to avoid overlap with the center user
//           newX += (60 - distanceToCenter) * (newX - centerUserX) / distanceToCenter;
//           newY += (60 - distanceToCenter) * (newY - centerUserY) / distanceToCenter;
//         }
//
//         // Check for collisions and adjust positions with other avatars
//         int maxIterations = 5;
//         for (int i = 0; i < maxIterations; i++) {
//           bool adjusted = false;
//           for (Widget otherAvatar in avatars) {
//             if (avatar != otherAvatar) {
//               double otherX = (otherAvatar as Positioned).left ?? 0.0;
//               double otherY = (otherAvatar as Positioned).top ?? 0.0;
//
//               double distance = sqrt((newX - otherX) * (newX - otherX) + (newY - otherY) * (newY - otherY));
//
//               if (distance < 60) {
//                 // Adjust positions to avoid overlap with other avatars
//                 newX += (60 - distance) * (newX - otherX) / distance;
//                 newY += (60 - distance) * (newY - otherY) / distance;
//                 adjusted = true;
//               }
//             }
//           }
//
//           if (!adjusted) {
//             // If no adjustment is needed, break out of the loop
//             break;
//           }
//         }
//
//         return Positioned(
//           left: newX,
//           top: newY,
//           child: CircleAvatar(
//             radius: 30,
//             backgroundImage: (avatar.child as CircleAvatar).backgroundImage,
//           ),
//         );
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Simulate API data with 5 different users
//     List<UserData> userDataList = [
//       UserData(id: 1, name: "User 1", image: "assets/1.png"),
//       UserData(id: 2, name: "User 2", image: "assets/2.png"),
//       UserData(id: 3, name: "User 3", image: "assets/3.png"),
//       UserData(id: 4, name: "User 4", image: "assets/4.png"),
//       UserData(id: 5, name: "User 5", image: "assets/1.png"),
//       UserData(id: 5, name: "User 5", image: "assets/2.png"),
//       UserData(id: 5, name: "User 5", image: "assets/3.png"),
//       UserData(id: 5, name: "User 5", image: "assets/4.png"),
//       UserData(id: 5, name: "User 5", image: "assets/1.png"),
//       UserData(id: 5, name: "User 5", image: "assets/2.png"),
//       UserData(id: 5, name: "User 5", image: "assets/3.png"),
//     ];
//
//     // If avatars list is empty, create initial avatars
//     if (avatars.isEmpty) {
//       for (UserData userData in userDataList) {
//         double initX = Random().nextDouble() * MediaQuery.of(context).size.width;
//         double initY = Random().nextDouble() * MediaQuery.of(context).size.height;
//
//         avatars.add(
//           Positioned(
//             left: initX,
//             top: initY,
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(userData.image),
//             ),
//           ),
//         );
//
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Moving Circles'),
//       ),
//       body: Stack(
//         children: [
//           ...avatars,
//           Positioned(
//             left: MediaQuery.of(context).size.width / 2 - 30,
//             top: MediaQuery.of(context).size.height / 2 - 30,
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage('assets/5.png'), // Change to the desired asset path
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// class UserData {
//   final int id;
//   final String name;
//   final String image;
//
//   UserData({required this.id, required this.name, required this.image});
// }
//
// void main() {
//   runApp(MaterialApp(home: MyScreen()));
// }




import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Widget> avatars;
  bool shouldMove = true; // Flag to control avatar movement

  @override
  void initState() {
    super.initState();

    avatars = [];

    _controller = AnimationController(
      duration: Duration(seconds: 100),
      vsync: this,
    )..addListener(() {
      moveCircles();
    });

    _controller.forward();
  }

  void moveCircles() {
    if (!shouldMove) {
      return;
    }

    setState(() {
      avatars = avatars.map((avatar) {
        double avatarX = (avatar as Positioned).left ?? 0.0;
        double avatarY = (avatar as Positioned).top ?? 0.0;

        double newX = lerpDouble(avatarX, MediaQuery.of(context).size.width / 2 - 30, _controller.value) ?? 0.0;
        double newY = lerpDouble(avatarY, MediaQuery.of(context).size.height / 2 - 30, _controller.value) ?? 0.0;

        // Check for collisions and adjust positions
        double centerUserX = MediaQuery.of(context).size.width / 2 - 30;
        double centerUserY = MediaQuery.of(context).size.height / 2 - 30;

        double distanceToCenter = sqrt((newX - centerUserX) * (newX - centerUserX) + (newY - centerUserY) * (newY - centerUserY));

        if (distanceToCenter < 60) {
          // Adjust positions to avoid overlap with the center user
          newX += (60 - distanceToCenter) * (newX - centerUserX) / distanceToCenter;
          newY += (60 - distanceToCenter) * (newY - centerUserY) / distanceToCenter;
        }

        // Check for collisions and adjust positions with other avatars
        for (Widget otherAvatar in avatars) {
          if (avatar != otherAvatar) {
            double otherX = (otherAvatar as Positioned).left ?? 0.0;
            double otherY = (otherAvatar as Positioned).top ?? 0.0;

            double distance = sqrt((newX - otherX) * (newX - otherX) + (newY - otherY) * (newY - otherY));

            if (distance < 60) {
              // Adjust positions to avoid overlap with other avatars
              newX += (60 - distance) * (newX - otherX) / distance;
              newY += (60 - distance) * (newY - otherY) / distance;
            }
          }
        }

        return Positioned(
          left: newX,
          top: newY,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: (avatar.child as CircleAvatar).backgroundImage,
          ),
        );
      }).toList();

      // Check if all avatars are close to the center, stop animation
      shouldMove = !avatars.every((avatar) {
        double avatarX = (avatar as Positioned).left ?? 0.0;
        double avatarY = (avatar as Positioned).top ?? 0.0;

        double distanceToCenter =
        sqrt((avatarX - MediaQuery.of(context).size.width / 2 + 30) * (avatarX - MediaQuery.of(context).size.width / 2 + 30) +
            (avatarY - MediaQuery.of(context).size.height / 2 + 30) * (avatarY - MediaQuery.of(context).size.height / 2 + 30));

        return distanceToCenter < 60;
      });

      // If all avatars are close to the center, stop the animation
      if (!shouldMove) {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Simulate API data with 5 different users
    List<UserData> userDataList = [
      UserData(id: 1, name: "User 1", image: "assets/1.png"),
      UserData(id: 2, name: "User 2", image: "assets/2.png"),
      UserData(id: 3, name: "User 3", image: "assets/3.png"),
      UserData(id: 4, name: "User 4", image: "assets/4.png"),
      UserData(id: 5, name: "User 5", image: "assets/1.png"),
      UserData(id: 5, name: "User 5", image: "assets/2.png"),
      UserData(id: 5, name: "User 5", image: "assets/3.png"),
      UserData(id: 5, name: "User 5", image: "assets/4.png"),
      UserData(id: 5, name: "User 5", image: "assets/1.png"),
      UserData(id: 5, name: "User 5", image: "assets/2.png"),
      UserData(id: 5, name: "User 5", image: "assets/3.png"),
    ];

    // If avatars list is empty, create initial avatars
    if (avatars.isEmpty) {
      for (UserData userData in userDataList) {
        double initX = Random().nextDouble() * MediaQuery.of(context).size.width;
        double initY = Random().nextDouble() * MediaQuery.of(context).size.height;

        avatars.add(
          Positioned(
            left: initX,
            top: initY,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(userData.image),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Circles'),
      ),
      body: Stack(
        children: [
          ...avatars,
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 30,
            top: MediaQuery.of(context).size.height / 2 - 30,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/5.png'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class UserData {
  final int id;
  final String name;
  final String image;

  UserData({required this.id, required this.name, required this.image});
}

void main() {
  runApp(MaterialApp(home: MyScreen()));
}

