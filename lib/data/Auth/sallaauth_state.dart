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

class SocialLogoutError extends SallaauthState {}

class SocialLogoutSucces extends SallaauthState {}

class SocialRegistryError extends SallaauthState {
  final String massage;

  SocialRegistryError(this.massage);
}

class SocialAddDataUserFireStoreSuccefull extends SallaauthState {
  final String uId;

  SocialAddDataUserFireStoreSuccefull(this.uId);
}

class SocialAddDataUserFireStoreError extends SallaauthState {}

class ShopChangePassword extends SallaauthState {}
//********************************************************* */

class SocialloginAdminLoaded extends SallaauthState {}

class SocialloginAdminSucceful extends SallaauthState {
  final String uId;

  SocialloginAdminSucceful(this.uId);
}

class SocialloginAdminError extends SallaauthState {
  final String massage;

  SocialloginAdminError(this.massage);
}

class SocialRegistryAdminLoaded extends SallaauthState {}

class SocialRegistryAdminSuccefully extends SallaauthState {
  final UserModel userModel;

  SocialRegistryAdminSuccefully(this.userModel);
}

class SocialRegistryAdminError extends SallaauthState {}

class SocialLogoutAdminError extends SallaauthState {}

class GetDataSucees extends SallaauthState {}

class SocialLogoutAdminSucces extends SallaauthState {}

class SalaaGetDataLoaded extends SallaauthState {}

class SalaaSendMassege extends SallaauthState {}

class SalaaSendData extends SallaauthState {}

class SalaaGetDataError extends SallaauthState {}

class SalaaGetDataSucces extends SallaauthState {}
