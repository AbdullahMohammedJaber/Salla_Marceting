part of 'sallaapp_cubit.dart';

@immutable
abstract class SallaappState {}

class SallaappInitial extends SallaappState {}

class SallaappChangeBottomNav extends SallaappState {}

class SallaappaddProductSucces extends SallaappState {}

class SalaaGetDataLoaded extends SallaappState{}
class SalaaGetDataError extends SallaappState{}

class SalaaGetDataSucces extends SallaappState{}

