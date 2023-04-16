import 'package:flames/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    List <String> name = ['Likes','Tony','James','Jordan'];
    List<String> imageUrls = [
      'assets/images/30-16-23-013043.png',
      'assets/images/30-16-23-013011.png',
      'assets/images/29-16-23-012949.png',
      'assets/images/31-16-23-013104.png',
    ];
    List <Chat> recent = [user1,user2,user3];

    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Find  Flames',
          style: TextStyle(color: Colors.pinkAccent,fontSize: 25,fontWeight: FontWeight.w300),
          //
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,

        leading: Container(
          padding: EdgeInsets.only(left:15),
          height:20,
          width:20,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/31-16-23-013118.png'),
            backgroundColor: Colors.white70,
            radius: 50,
           ),
        ),
          actions: [
      Container(
      margin: EdgeInsets.only(right: 10.0),
      child: IconButton(
        icon: Icon(Icons.list,
        color: Colors.black54,
        size: 35,),
        onPressed: () {
          // Handle search button press
        },
      ),
    )
          ]
        ),

      body: Column(
        children: <Widget>[
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children:<Widget>[
            Container(
              height: 125,
              color: Colors.white60,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount:4,
                  itemBuilder : (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),//add border radius here
                            child: Image.asset(imageUrls[index]
                            ,fit: BoxFit.contain,
                            height: 100,
                            width: 100,),//add image location here
                          ),
                          Row(
                            children: [
                              Text(name[index]),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              ),
            )
            ]
          ),
        ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 5,bottom: 35),
            width: 304,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.separated(itemBuilder: (context , index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(recent[index].imageUrl),
                    backgroundColor: Colors.white70,
                    radius: 35,
                  ),
                  title: Row(
                    children: [
                      Text(recent[index].name),
                      Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  subtitle: Text(recent[index].message),
                  trailing: Column(
                    children: <Widget>[
                      Container(
                        child: Text(recent[index].time,style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                          width:20,
                          height: 20,
                          decoration : BoxDecoration(
                           color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                                   recent[index].chat,
                                    style : TextStyle(
                                      color: Colors.white60,
                                    )
                              )
                          )
                      ),
                    ],
                  ),
                );
            },separatorBuilder: (context , index){
              return Divider(height: 30,thickness: 2,);
             },
             itemCount: recent.length,
            )
          )
      ],
      ),

      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}


class _BottomNavigationBar extends StatelessWidget{

  const _BottomNavigationBar({
    Key? key,
}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top : false,
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0,color: Colors.black26),
            ),
          ),
          padding: EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(icon: Icons.home_filled,),
              _NavigationBarItem(icon: Icons.travel_explore,),
              _NavigationBarItem(icon: Icons.edit_calendar,),
              SizedBox(
                height: 50,
                child: Column(
                  mainAxisSize : MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.question_answer,
                      size: 35,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
    );

  }
}

class _NavigationBarItem extends StatelessWidget{

  const _NavigationBarItem({
    Key? key, required this.icon,
  }) : super(key:key);

  final IconData icon;


  @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: 50,
       child: Column(
         mainAxisSize : MainAxisSize.min,
         children: [
           Icon(icon,
           size : 35,
           color: Colors.black54,
           ),
         ],
       ),
     );
  }

}
