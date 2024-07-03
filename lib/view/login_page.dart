import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/view/splashscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
  
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
      // gradient: LinearGradient(colors: [
      //     Color(0xffff4590),
      //      Color(0xff382743)
         
      // ],
      // begin: Alignment.topLeft,
      // end: Alignment.bottomRight,
      // tileMode: TileMode.clamp
      // )
      image: DecorationImage(image: AssetImage("assets/tajhotel.jpg",),
      fit: BoxFit.fitWidth)
    ),
      child: Scaffold(
              appBar: AppBar(
          backgroundColor: Colors.transparent,
          // title: Text("Login Page",style: TextStyle(color:  Color.fromARGB(255, 157, 245, 98)),
          // ),
          // centerTitle: true,
        ),
        backgroundColor:Colors.transparent,
        
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                              Lottie.asset("assets/hacker-using-laptop.json",
                              height: 200,
                              width: 180
                              
                                                            
                              ),
              SizedBox(height: 10,),
              Text("Login",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              child:TextField(
                style: TextStyle(color: Color.fromARGB(255, 209, 50, 50)),
                decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color:  Colors.black,
                      
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5)
                    ),
                    filled: true,
                    fillColor: Colors.white54,
      
                ),    
               ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding: 
              EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color:  Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5)
                  ),
                  fillColor: Colors.white54,
                  filled: true,
                ),
              ),
              ),
              SizedBox(height: 30),
            ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 50),
                 shape: ContinuousRectangleBorder(
                  side: BorderSide(width: 1.5),
                  
                  borderRadius: BorderRadius.circular(12),
                  
                 ),
                 backgroundColor: Colors.red
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
              },
              child: Text('Login',style: TextStyle(color: Colors.white),),
            ),
      
            ],
          ),
        ),
      ),
    );
  }
}