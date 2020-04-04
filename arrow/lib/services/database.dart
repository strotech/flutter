import 'package:arrow/models/brew.dart';
import 'package:arrow/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =  Firestore.instance.collection('brews');
  Future updateUserData(String sugars,String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars':sugars,
      'name':name,
      'strength':strength
    });
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot querySnapshot){
    return querySnapshot.documents.map((doc){
      return Brew(
        name:doc.data['name'] ?? '',
        sugars:doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 0
      );}
    ).toList();
  }

  UserData _userDataFromSnapshots(DocumentSnapshot docSnapshot) {
    return UserData(
      uid:uid,
      name:docSnapshot.data['name'],
      strength:docSnapshot.data['strength'],
      sugars:docSnapshot.data['sugars']

    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshots);
  }
}