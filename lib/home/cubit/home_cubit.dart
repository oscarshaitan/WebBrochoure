import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:oscar_web_resume/_core/models/resume_owner.dart';
import 'package:oscar_web_resume/_core/repository/resume_repository.dart';
import 'dart:typed_data';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ResumeRepository _resumeRepository;
  ResumeOwner _resumeOwner;

  HomeCubit(this._resumeRepository) : super(HomeInitial()) {
    _init();
  }

  _init() async {
    _resumeOwner = ResumeOwner.fromJson(await _resumeRepository.getResume);
    var storage = FirebaseStorage.instance;
  }

  loadResume() async {
    if (_resumeOwner != null) {
      emit(ResumeLoaded(resumeOwner: _resumeOwner));
    } else {
      await _init();
      emit(ResumeLoaded(resumeOwner: _resumeOwner));
    }
  }
}
