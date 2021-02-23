import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:oscar_web_resume/_core/repository/resume_repository.dart';

import 'home/cubit/home_cubit.dart';

final sl = GetIt.instance;

init() {
  sl.registerLazySingleton<ResumeRepository>(() => ResumeRepository(sl()));

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
