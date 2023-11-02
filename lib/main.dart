import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/streamBuilder.dart';

void main() async{ runApp(

GetMaterialApp(home: Home(),
debugShowCheckedModeBanner: false,
));
await Firebase.initializeApp();}

class Controller extends GetxController{
  var count = 0.obs;
  var name = 'Jonatas Borges'.obs;
  increment() => count++;
  changeTheme()=>Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());

}
class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.name} ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Column(
          children: [
            Center(child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(FlutterStreamBuilder()))),

            //FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
            FloatingActionButton(child: Icon(Icons.add), onPressed: c.changeTheme)
          ],
        ),
       );
  }
}