import 'dart:async';

import 'package:ekra/features/Authentication/bloc/auth_bloc.dart';
import 'package:ekra/homebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  Timer? _timer;
  bool _isResendButtonEnabled = false;
  Timer? _resendButtonTimer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Get.to(() => const Homebar());
      }
    });

    showTimer();

    voidEnableResendButton();
    super.initState();
  }

  voidEnableResendButton() {
    Future.delayed(const Duration(minutes: 1), () {
      setState(() {
        _isResendButtonEnabled = true;
      });
    });
  }

  showTimer() {
    _resendButtonTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 60) {
        timer.cancel();
        setState(() {
          _isResendButtonEnabled = true;
        });
      } else {
        setState(() {
          _isResendButtonEnabled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    _resendButtonTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 20),
              const Spacer(),
              const Text('A verification email has been sent to your email address.'),
              const Text('Please verify your email address to continue.'),
              const Spacer(),
              _resendButtonTimer != null && !_isResendButtonEnabled
                  ? Text('Resend email in ${60 - _resendButtonTimer!.tick} seconds')
                  : const Text(
                      'Didn\'t receive the email?',
                    ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is ResendVerificationEmailSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Verification email sent successfully'),
                      ),
                    );
                    voidEnableResendButton();
                  } else if (state is ResendVerificationEmailFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ResendVerificationEmailInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return TextButton(
                    onPressed: _isResendButtonEnabled
                        ? () {
                            context.read<AuthBloc>().add(const ResendVerificationEmailEvent());
                            showTimer();
                          }
                        : null,
                    child: const Text('Resend Email'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
