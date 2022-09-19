// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'data_models.dart';
// import 'global.dart';



// class Document<T> {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   String? path;
//   DocumentReference? ref;
//   Document({required this.path}) {
//     ref = _db.doc(path!);
//   }

//   Future<T> getData() async {
//     return ref!.get().then((value) => Global.models[T](value.data) as T);
//   }
//   Future<Stream<T>> stramData() async {
//     return ref!.snapshots().map((event) => Global.models[T](event.data) as T);
//   }
// }



// class Collection<T> {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   String? path;
//   CollectionReference? ref;
//   Collection({required this.path}) {
//     ref = _db.collection(path!);
//   }

//   Future<List<T>> getData() async {
//     var snapshots = await ref?.get();
//     return snapshots!.docs.map((doc) => Global.models[T](doc.data) as T).toList();
//   }
//   Future<Stream<List<T>>> stramData() async {
//     return ref!.snapshots().map((list)=>list.docs.map((event)  => Global.models[T](event.data) as T).toList());
//   }
// }
