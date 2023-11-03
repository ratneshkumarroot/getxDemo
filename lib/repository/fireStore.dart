//
//
// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:getx_demo_app/modelClass/dataReceive.dart';
//
// class FireStore{
//   final databaseReference = FirebaseFirestore.instance;
//
//   void createRecord(String chapter_value) async {
//     await databaseReference.collection("books")
//         .doc("chaptor $chapter_value")
//         .set({
//       'title': 'Mastering Flutter',
//       'description': 'Programming Guide for Dart'
//     });
//
//     DocumentReference ref = await databaseReference.collection("books")
//         .add({
//       'title': 'Flutter in Action',
//       'description': 'Complete Programming Guide to learn Flutter'
//     });
//     print(ref.id);
//   }
//
//     Future<List<Book>> getData()async{
//      List<Book> value=[];
//     var snap= await databaseReference
//         .collection("books")
//         .get();
//     snap.docs.forEach((element) {
//       var data=element.data() ;
//       value.add(Book.fromJson(data));
//     });
//      return value;
//   }
//
//   void updateData() {
//     try {
//       databaseReference
//           .collection('books')
//           .doc('1')
//           .update({'description': 'Head First Flutter'});
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   void deleteData() {
//     try {
//       databaseReference
//           .collection('books')
//           .doc('1')
//           .delete();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
// }