part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  ResumeOwner get resumeOwner;
}

class HomeInitial extends HomeState {
  final resumeOwner = null;
}

class ResumeLoaded extends HomeState {
  final resumeOwner;

  ResumeLoaded({this.resumeOwner});
}
