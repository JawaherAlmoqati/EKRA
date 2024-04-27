import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekra/features/personalization/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserModel? user;
  AuthBloc() : super(AuthInitial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<LoginEvent>((event, emit) async {
      emit(LoginInProgress());
      try {
        await auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(const LoginSuccess());
      } on FirebaseException catch (e) {
        emit(LoginFailure(errorMessage: e.code));
      } catch (e) {
        emit(LoginFailure(errorMessage: e.toString()));
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(SignUpInProgress());
      try {
        await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await auth.currentUser!.sendEmailVerification(
          ActionCodeSettings(
            url: 'https://ekra-1.web.app',
            handleCodeInApp: true,
            iOSBundleId: 'com.example.ekra',
            androidPackageName: 'com.example.ekra',
            androidInstallApp: true,
            androidMinimumVersion: '16',
          ),
        );
        await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).set({
          'fullName': event.fullName,
          'email': event.email,
          'phone': event.phoneNumber,
          'profilePicture': '',
          'bio': '',
        });
        emit(const SignUpSuccess());
      } on FirebaseException catch (e) {
        emit(SignUpFailure(errorMessage: e.code));
      } catch (e) {
        emit(SignUpFailure(errorMessage: e.toString()));
      }
    });
    on<GetCurrentUserEvent>((event, emit) async {
      try {
        final result = await FirebaseFirestore.instance
            .collection('users')
            .doc(
              auth.currentUser!.uid,
            )
            .get();
        user = UserModel.fromSnapshot(result);
      } on FirebaseException catch (e) {
        emit(SignUpFailure(errorMessage: e.code));
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
