import 'package:flutter/material.dart';
import 'package:order_app/screens/home/components/app_bar.dart';
import 'package:order_app/screens/home/components/bottom_nav_bar.dart';
import 'package:order_app/screens/home/details/components/app_bar.dart';
//import 'package:order_app/screens/home/home-screen.dart';
import 'package:order_app/screens/home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(context),
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),

              // height: 300,
              // width: 150,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/images/theme_sign_in.jpg'),
              //   ),
              // ),
            ),

            // Container(
            //   height: 100,
            //   child: Text(
            //     "Sign up",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                // margin: EdgeInsets.only(right: 20, top: 20),
                margin: EdgeInsets.only(right: 20, top: 20, left: 20),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     labelText: "Email",
                    //     hintText: "Enter your email",
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        //
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100],
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 1),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 250, 246, 246),
                              )
                            ]),
                        child: TextField(
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.green[500],
                            ),
                            hintText: "Enter your email",
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        //padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100],
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 1),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 250, 246, 246),
                              )
                            ]),
                        child: TextField(
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone_android_outlined,
                              color: Colors.green[500],
                            ),
                            hintText: "Enter your phone password",
                          ),
                        )),

                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        //padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100],
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 1),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 250, 246, 246),
                              )
                            ]),
                        child: TextField(
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.key,
                              color: Colors.green[500],
                            ),
                            hintText: "Enter your password again",
                          ),
                        )),
                    // Container(
                    //   margin: EdgeInsets.only(top: 20, right: 20),
                    //   alignment: Alignment.centerRight,
                    //   child: GestureDetector(
                    //     child: Text("Forget Password?"),
                    //     onTap: () => {},
                    //   ),
                    // ),
                    GestureDetector(
                      //onTap: () => {},
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        ),
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )

                    // TextField(
                    //   cursorColor: Colors.green,
                    //   decoration: InputDecoration(
                    //     icon: Icon(
                    //       Icons.email,
                    //       color: Colors.grey,
                    //     ),
                    //     hintText: "Enter Email",
                    //     enabledBorder: InputBorder.none,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),

      // appBar: AppBar(
      //   title: Text("Sign in"),

      // ),

      //homeAppBarSignIn(context),
    );
  }
}
