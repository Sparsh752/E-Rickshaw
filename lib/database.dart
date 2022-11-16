
import 'package:cloud_firestore/cloud_firestore.dart';

class Databases{
  late FirebaseFirestore firestore;
  initialise(){
    firestore = FirebaseFirestore.instance;
  }
  void create_driver(String name,String _uid,String number,String email, String number_plate)async{
    try{
      await firestore.collection("drivers").doc(_uid).set({'name':name,'number':number,'email':email,'numberplate':number_plate,'type':'driver'});
    }catch(e){
      print(e);
    }
  }
  void create_passenger(String name,String _uid,String number,String email)async{
    try{
      await firestore.collection("passengers").doc(_uid).set({'name':name,'number':number,'email':email,'type':'passenger'});
    }catch(e){
      print(e);
    }
  }
  void create_request(String from,String to,String uid,String pending,String driver_uid)async{
    try{
      await firestore.collection("requests").doc(uid).set({'from':from,'to':to,'pending':pending,'driver_uid':driver_uid});
    }catch(e){
      print(e);
    }
  }
  Future read() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot= await firestore.collection('requests').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a ={"id" : doc.id, "from" : doc['from'], "to" : doc['to'],"pending":doc['pending'],"driver_uid":doc['driver_uid']};
          docs.add(a);
        }
        return docs;

      }
    } catch(e){
      print(e);
      return docs;
    }

  }
  void delete(String id) async{
    try{
      await firestore.collection("requests").doc(id).delete();
    }catch(e){
      print(e);
    }
  }
  Future check_request(String uid) async{
    late Map? a;
    try{
      var snapshot=await firestore.collection("requests").doc(uid).get();
      a=snapshot.data();
      // print(a!['name']);
      return a;

    } catch(e){
      print(e);
    }


  }
  Future get_passenger(String uid) async{
    late Map? a;
    try{
      var snapshot=await firestore.collection("passengers").doc(uid).get();
      a=snapshot.data();
      // print(a!['name']);
      return a;

    } catch(e){
      print(e);
    }


  }
  Future get_driver(String uid) async{
    late Map? a;
    try{
      var snapshot=await firestore.collection("drivers").doc(uid).get();
      a=snapshot.data();
      // print(a!['name']);
      return a;

    } catch(e){
      print(e);
    }


  }
}