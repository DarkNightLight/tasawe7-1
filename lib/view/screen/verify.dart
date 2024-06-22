import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/compnent/Bar.dart';

class Verify extends StatelessWidget {
  const Verify({Key? key, required String email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bar5(
        title: "تأكيد الحساب",
        child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Center(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(children: [
                FirebaseAuth.instance.currentUser!.emailVerified
                    ? const Text("Welcome")
                    : MaterialButton(
                        color: Colors.cyan,
                        onPressed: () {
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                        },
                        child: const Text("Please Verify Your email"),
                      ),
              ]),
            ))));
  }
}
