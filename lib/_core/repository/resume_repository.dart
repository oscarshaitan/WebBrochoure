import 'package:cloud_firestore/cloud_firestore.dart';

class ResumeRepository {
  final FirebaseFirestore firestore;

  ResumeRepository(this.firestore);

  Future<Map<String, dynamic>> get getResume async =>
      (await firestore.collection('resume').doc('Jb0uFtXuv56RkNzPGPDb').get())
          .data();
}
