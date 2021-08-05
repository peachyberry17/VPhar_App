import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileServices {
  static CollectionReference profileList =
    FirebaseFirestore.instance.collection('profileInfo');

  static Future <void> signUp(
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
    String uid, ) async {
    return await profileList
    .doc(uid)
    .set({
      'email' : email,
      'instansi pelayanan': agency,
      'nama': name,
      'nomor bpjs': bpjs,
      'nomor sia': sia,
      'nomor sip': sip,
      'nomor telepon' : phone,
      'pekerjaan' : job,
      'status': role,
      'tempat praktik': place,
      'nomor uid': uid
    });
  }



//   static Future <void> getCurrentUserData() async{
//     try {
//       DocumentSnapshot ds = await userCollection.doc(uid).get();
//       String  firstname = ds.get('FirstName');
//       String lastname = ds.get('LastName');
//       return [firstname,lastname];
//     }catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
// }

// static Future <FirebaseUser> getProfileName() async {
  
//   try{
//     await ProfileServices.getDocuments(String uid).then((querySnapshot) {
//       querySnapshot.documents.forEach(element) {
//         itemsList.add(element.data);
//       };
//     });
//   }
//   catch (e) {
//     print(e.toString());
//     return null;
//   }
// }

}


