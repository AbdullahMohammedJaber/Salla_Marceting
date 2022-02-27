import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sallaty/Authentecation/Login.dart';
import 'package:sallaty/helper/CashHelper.dart';
import 'package:sallaty/helper/const.dart';
import 'package:sallaty/model/UserModel.dart';
import 'package:sallaty/model/massegeModel.dart';
import 'package:sallaty/model/product.dart';

part 'sallaauth_state.dart';

class SallaauthCubit extends Cubit<SallaauthState> {
  SallaauthCubit() : super(SallaauthInitial());
  static SallaauthCubit get(context) => BlocProvider.of(context);
  UserModel model;
  UserModel Admin;
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
    model = UserModel(
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

  void Logout(context) {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
      emit(SocialLogoutSucces());
    }).catchError((error) {
      emit(SocialLogoutError());
    });
  }

  bool isPassword = true;
  IconData icon = Icons.visibility;
  void ChangePassword() {
    if (isPassword) {
      isPassword = !isPassword;
      icon = Icons.visibility_off;
    } else {
      isPassword = !isPassword;
      icon = Icons.visibility;
    }
    emit(ShopChangePassword());
  }

//*********************************************************** */
  void loginAdmin({
    @required String email,
    @required String password,
  }) {
    emit(SocialloginAdminLoaded());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // ignore: avoid_print
      print(value.user.uid);
      CashHelper.setDataApp(key: 'isLogin', value: value.user.uid);

      emit(SocialloginAdminSucceful(value.user.uid));
    }).catchError((onError) {
      // ignore: avoid_print
      print(onError.toString());
      emit(SocialloginAdminError(onError.toString()));
    });
  }

  void LogoutAdmin(context) {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
      emit(SocialLogoutSucces());
    }).catchError((error) {
      emit(SocialLogoutError());
    });
  }

  void registruAdmin({
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
      addDataUser(
        email: email,
        uId: value.user.uid,
      );
      CashHelper.setDataApp(key: 'isLogin', value: value.user.uid);
    }).catchError((onError) {
      emit(SocialRegistryAdminError());
    });
  }

  void addDataAdmin({
    @required String email,
    @required String uId,
  }) {
    Admin = UserModel(
      email: email,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('Admin')
        .doc(uId)
        .set(Admin.toMap())
        .then((value) {
      emit(SocialAddDataUserFireStoreSuccefull(uId));
    }).catchError((onError) {
      emit(SocialAddDataUserFireStoreError());
    });
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(Admin.toMap())
        .then((value) {
      emit(SocialAddDataUserFireStoreSuccefull(uId));
    }).catchError((onError) {
      emit(SocialAddDataUserFireStoreError());
    });
  }

  List<Product> _Myproducts = [];

  List<Product> get Myproducts {
    return [..._Myproducts];
  }

  Future<void> fetchMyProducts() async {
    emit(SalaaGetDataLoaded());
    return await FirebaseFirestore.instance
        .collection('products')
        .doc(Admin.uId)
        .get()
        .then((value) {
      _Myproducts = [];

      // print('element.get(productBrand), ${element.get('productBrand')}');

      _Myproducts.insert(
        0,
        Product(
            id: value.get('productId'),
            title: value.get('productTitle'),
            descreption: value.get('productDescription'),
            price: double.parse(
              value.get('price'),
            ),
            imageUrl: value.get('productImage'),
            productCategoryName: value.get('productCategory'),
            quantity: int.parse(
              value.get('price'),
            ),
            isPopular: true),
      );

      emit(SalaaGetDataSucces());
    });
  }

  List<UserModel> users = [];
  void GetAllUser() {
    FirebaseFirestore.instance.collection('Users').get().then((value) {
      value.docs.forEach((element) {
        users.add(UserModel.fromJson(element.data()));
        emit(SalaaSendData());
      });
    });
  }

  void sendMessage({
    @required String receiverId,
    @required String dateTime,
    @required String text,
  }) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .collection('chat')
        .doc(receiverId)
        .collection('massege')
        .add(model.toMap())
        .then((value) {
      emit(SalaaSendMassege());
    });
    FirebaseFirestore.instance
        .collection('Users')
        .doc(receiverId)
        .collection('chat')
        .doc(uId)
        .collection('massege')
        .add(model.toMap())
        .then((value) {
      emit(SalaaSendMassege());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    @required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .collection('chat')
        .doc(receiverId)
        .collection('massege')
        .snapshots()
        .listen((event) {
      emit(GetDataSucees());
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
    });
  }
}
