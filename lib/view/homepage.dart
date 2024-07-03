import 'package:flutter/material.dart';
import 'package:mumbai_city/modal/education_modal.dart';
import 'package:mumbai_city/modal/homepage_modal.dart';
import 'package:mumbai_city/view/bank.dart';
import 'package:mumbai_city/view/bus.dart';
import 'package:mumbai_city/view/cafe.dart';
import 'package:mumbai_city/view/car.dart';
import 'package:mumbai_city/view/education.dart';
import 'package:mumbai_city/view/emergency.dart';
import 'package:mumbai_city/view/essential.dart';
import 'package:mumbai_city/view/help.dart';
import 'package:mumbai_city/view/hotel.dart';
import 'package:mumbai_city/view/login_page.dart';
import 'package:mumbai_city/view/setting.dart';
import 'package:mumbai_city/view/shopping.dart';
import 'package:mumbai_city/view/travelpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    List<HomeModal> homeModal=[
      HomeModal(image: "assets/education.jpg", title: "EDUCATION", onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => EduactionPage()));}),
      
       HomeModal(image:"assets/hotel.jpg" , title: "HOTEL", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelPage()));}),
       HomeModal(image: "assets/bank.jpg", title: "ATM AND BANK", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BankPage()));}),
       HomeModal(image: "assets/car3.png", title: "RENTAL CARS", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CarRent()));}),
       HomeModal(image: "assets/travel.png", title: "TRAVEL", onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>TravelPage()));}),
       HomeModal(image: "assets/Cafe.jpg", title: "CAFE", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CafePage()));}),
       HomeModal(image: "assets/emergency.jpg", title: "EMERGENCY SERVICES", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmergencyPage()));}),
       HomeModal(image: "assets/essential.png", title: "ESSENTIAL SERVICES", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EssentialPage()));}),
       HomeModal(image: "assets/best.jpg", title: "BEST", onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>BusPage()));})
    ];
    List<Color>cardColors=[
      Color.fromARGB(255, 69, 155, 241),
      Color.fromARGB(255, 218, 140, 140),
      Color.fromARGB(255, 171, 235, 171),
      Color.fromARGB(255, 243, 205, 149),
      Color.fromARGB(255, 216, 149, 224),
    ];
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       actions:[ IconButton(
            onPressed: () async {
              SharedPreferences clear = await SharedPreferences.getInstance();

              clear.clear();
              setState(() {});

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout,color:Colors.white,
            )
            ),
       ],
          iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 244, 180, 180)),
        backgroundColor: Colors.black,
           title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Icon(Icons.home,size: 20,),
              SizedBox(width:10),
               Text(
                         'DashBoard',
                         style: TextStyle(
                          
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300
                         ), 
                       ),
             ],
           ),
        centerTitle: true,
      ),  
      drawer: Drawer(
        shadowColor: Colors.black,
         backgroundColor: Colors.black,
        child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             Color.fromARGB(255, 240, 170, 114),
              Colors.blueGrey.shade100,
            ],
          ),
        ),
        child:
          Column(
            children: [
            Container(
              color: Colors.transparent,
              child: DrawerHeader(
                
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Padding(padding: 
                EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(padding: 
                    EdgeInsets.all(8.0),
                    // child: CircleAvatar(
                    //   radius:40 ,
                    //   backgroundImage: AssetImage("assets\chef_3.png"),
                    // ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/person.jpg"))

                        
                      ),
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Harshal ",style: TextStyle(color: Colors.black,fontSize: 20),),
                                                      SizedBox(
                                height: 10,
                              ),
                              Text(
                                "hj90300@gmail.com",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "9545276793",
                                style: TextStyle(color: Colors.black),
                              )

                      ],
                    )
                    )
                  ],
                ),
                ),
              ),
            ),

       SizedBox(
        height: 10,
       ),

                     Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()));
                        },
                        child: Text(
                          "App Settings",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()));
                        },
                        child:
                         Text(
                          "Setting",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HelpPage()));
                        },
                        child: Text(
                          "Help",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ))
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 226, 42, 42),
                    ),
                  )),



            ],

            
          ),
      )
      ),

      body: Container(
        
             decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/taju.jpg"),
              fit: BoxFit.fill)
             ),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end:Alignment.bottomCenter,
        //     colors: [
        //      Color.fromARGB(255, 240, 170, 114),
        //       Colors.blueGrey.shade100,
        //   ]
        //   )
        // ),
        child: Padding(padding: EdgeInsets.all(16.0),
        child: GridView.builder(gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              childAspectRatio: 0.8,
            ),
            itemCount: homeModal.length
        , itemBuilder: (contex,i){
             return GestureDetector(
              onTap:(){
                homeModal[i].onTap();

              },
              child: Card(
               elevation: 4,
               shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10)
               ),
               color: cardColors[i % cardColors.length],
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(homeModal[i].image,
                  width: double.infinity,
                  height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                  
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      shape: BoxShape.rectangle
                    ),
                    child: Text(
                      homeModal[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 36, 31, 31),fontSize: 19,fontWeight: FontWeight.w900),
                    ),
                  )
                  
                ],
               ),
              ),


             );
        }
        ),
        ),
      ),
    );
  }
}