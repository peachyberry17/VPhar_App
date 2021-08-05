import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:start_trial/services/medicine_services.dart';
import 'package:start_trial/services/profile_services.dart';

class AuthServices{
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signUp(
    String email,
    String agency,
    String name,
    String bpjs,
    String sia,
    String sip,
    String phone,
    String job,
    String role,
    String place,
    String password) async {
    try{

    // TODO: cek ke firestore
    // TODO: lakukan query berdasarkan no SIP yang dimasukan
    // TODO: jika no SIP yang di query itu ada , tampilkan error
    // SHOW ERROR

    // TODO: jika no SIP ada, baru panggil fungsi ini

      UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
    User user = result.user;
    await ProfileServices.signUp(email, agency, name, bpjs, sia, sip, phone, job, role, place, user.uid);

    return user;
    } catch(e){
      print(e.toString());

      return null;
    }
  }

  static Future<User> signIn(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email, password: password);
    User user = result.user;
    
    return user;
    } catch(e){
      print(e.toString());

      return null;
    }
  }

  //Get Current User
  // static Future <void> currentUser() async{
  //   return await _auth.currentUser();
  // }

  static Future<void> signOut() async{
  _auth.signOut();
  }

  static Stream<User> get firebaseUserStream => _auth.authStateChanges();
}

