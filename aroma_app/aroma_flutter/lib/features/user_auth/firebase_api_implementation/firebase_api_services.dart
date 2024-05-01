//import 'package:aroma_flutter/global/common/toast.dart';
import 'package:cloud_functions/cloud_functions.dart';

class FirebaseAPIService {
  Future<void> sumbitReport(
      String smellType, int severity, String description) async {
    // create a firebase functions instance
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('submitReport');
  }
}
