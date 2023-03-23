// import 'package:flutter/material.dart';
// import 'package:order_food/screens/home/components/app_bar.dart';
// import 'package:order_food/screens/home/components/bottom_nav_bar.dart';
// //import 'package:order_food/screens/home/home-screen.dart';
// import 'package:order_food/screens/home/home_screen.dart';
// import 'package:order_food/screens/sign_up/sign_up.dart';

// class SignInScreen extends StatelessWidget {
//   static String routeName = "/sign_in";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       //backgroundColor: Colors.white,
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             Container(
//               height: 300,
//               width: 150,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/green_milk_tea_canva.png'),
//                 ),
//               ),
//             ),
//             Text(
//               "Sign in",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 0.0),
//               child: Container(
//                 margin: EdgeInsets.only(right: 20, top: 20, left: 20),
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   children: [
//                     Container(
//                         margin: EdgeInsets.only(left: 20, right: 20, top: 25),
//                         padding: EdgeInsets.only(left: 20, right: 20),
//                         //padding: EdgeInsets.only(left: 20, right: 20),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.grey[100],
//                             boxShadow: [
//                               BoxShadow(
//                                 offset: Offset(4, 1),
//                                 blurRadius: 50,
//                                 color: Color.fromARGB(255, 250, 246, 246),
//                               )
//                             ]),
//                         child: TextFormField(
//                             keyboardType: TextInputType.emailAddress,
//                           cursorColor: Colors.green,
//                            validator: (value) {
//                             if (value!.isEmpty || !value.contains('@')) {
//                               return 'Invalid email!';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             // _authData['email'] = value!;
//                           },
//                           decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.phone_android_outlined,
//                               color: Colors.green[500],
//                             ),
//                             hintText: "Enter your email",
//                           ),
//                         )),

//                     Container(
//                         margin: EdgeInsets.only(left: 20, right: 20, top: 25),
//                         padding: EdgeInsets.only(left: 20, right: 20),
//                         //padding: EdgeInsets.only(left: 20, right: 20),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.grey[100],
//                             boxShadow: [
//                               BoxShadow(
//                                 offset: Offset(4, 1),
//                                 blurRadius: 50,
//                                 color: Color.fromARGB(255, 250, 246, 246),
//                               )
//                             ]),
//                         child: TextFormField(
//                            enabled: _authMode == AuthMode.signup,
//                           decoration: const InputDecoration(
//                               labelText: 'Confirm Password'),
//                           obscureText: true,
//                           validator: _authMode == AuthMode.signup
//                               ? (value) {
//                                   if (value != _passwordController.text) {
//                                     return 'Passwords do not match!';
//                                   }
//                                   return null;
//                                 }
//                               : null,
//                           //  obscureText: true,
//                           //   validator: (value) {
//                           //   if (value == null || value.length < 5) {
//                           //     return 'Password is too short!';
//                           //   }
//                           //   return null;
//                           // },
//                           // onSaved: (value) {
//                           //   _authData['password'] = value!;
//                           // },
//                           // controller: _passwordController,
//                           cursorColor: Colors.green,
//                           decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.key,
//                               color: Colors.green[500],
//                             ),
//                             hintText: "Enter your password",
//                           ),
//                         )),
//                     Container(
//                       margin: EdgeInsets.only(top: 20, right: 20),
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         child: Text("Forget Password?"),
//                         onTap: () => {},
//                       ),
//                     ),
//                     GestureDetector(
//                       // onTap: () => {},
//                       onTap: () => {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return HomeScreen();
//                             },
//                           ),
//                         ),
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20, right: 20, top: 30),
//                         alignment: Alignment.center,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Text(
//                           "SIGN IN",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 20, right: 20),
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         child: Text(
//                           "Register now!",
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                           ),

//                           // textAlign: TextAlign.center,
//                         ),
//                         onTap: () => {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return SignUpScreen();
//                               },
//                             ),
//                           ),
//                         },
//                       ),
//                     ),
//                     // TextField(
//                     //   cursorColor: Colors.green,
//                     //   decoration: InputDecoration(
//                     //     icon: Icon(
//                     //       Icons.email,
//                     //       color: Colors.grey,
//                     //     ),
//                     //     hintText: "Enter Email",
//                     //     enabledBorder: InputBorder.none,
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(),

//       // appBar: AppBar(
//       //   title: Text("Sign in"),

//       // ),

//       //homeAppBarSignIn(context),
//     );
//   }
// }
