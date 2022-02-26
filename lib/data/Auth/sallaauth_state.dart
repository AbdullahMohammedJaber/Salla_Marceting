part of 'sallaauth_cubit.dart';

@immutable
abstract class SallaauthState {}

class SallaauthInitial extends SallaauthState {}

class SocialloginLoaded extends SallaauthState {}

class SocialloginSuccefully extends SallaauthState {
  final String uId;

  SocialloginSuccefully(this.uId);
}

class SocialloginError extends SallaauthState {
  final String massage;

  SocialloginError(this.massage);
}

class SocialGetDataUserFireStoreSuccefull extends SallaauthState {
  final UserModel userModel;

  SocialGetDataUserFireStoreSuccefull(this.userModel);
}

class SocialGetDataUserFireStoreError extends SallaauthState {}

class SocialRegistryLoaded extends SallaauthState {}

class SocialRegistrySuccefully extends SallaauthState {
  final UserModel userModel;

  SocialRegistrySuccefully(this.userModel);
}

class SocialRegistryError extends SallaauthState {
  final String massage;

  SocialRegistryError(this.massage);
}

class SocialAddDataUserFireStoreSuccefull extends SallaauthState {
  final String uId;

  SocialAddDataUserFireStoreSuccefull(this.uId);
}

class SocialAddDataUserFireStoreError extends SallaauthState {}
