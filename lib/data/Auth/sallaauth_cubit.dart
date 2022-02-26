import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sallaty/helper/CashHelper.dart';
import 'package:sallaty/model/UserModel.dart';

part 'sallaauth_state.dart';

class SallaauthCubit extends Cubit<SallaauthState> {
  SallaauthCubit() : super(SallaauthInitial());
  static SallaauthCubit get(context) => BlocProvider.of(context);
  void loginUser({
    @required String email,
    @required String password,
  }) {
    emit(SocialloginLoaded());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // ignore: avoid_print
      print(value.user.uid);
      CashHelper.setDataApp(key: 'isLogin', value: value.user.uid);

      emit(SocialloginSuccefully(value.user.uid));
    }).catchError((onError) {
      // ignore: avoid_print
      print(onError.toString());
      emit(SocialloginError(onError.toString()));
    });
  }

  void registruUser({
    @required String email,
    @required String password,
  }) {
    emit(SocialRegistryLoaded());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CashHelper.setDataApp(key: 'isLogin', value: value.user.uid);
      addDataUser(
        email: email,
        uId: value.user.uid,
      );
    }).catchError((onError) {
      emit(SocialRegistryError(onError.toString()));
    });
  }

  void addDataUser({
    @required String email,
    @required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialAddDataUserFireStoreSuccefull(uId));
    }).catchError((onError) {
      emit(SocialAddDataUserFireStoreError());
    });
  }
}
