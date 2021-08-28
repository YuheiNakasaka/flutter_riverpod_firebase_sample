import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_sample/app/providers.dart';
import 'package:riverpod_firebase_sample/app/sign_in/sign_in_view_model.dart';
import 'package:riverpod_firebase_sample/widgets/colored_button.dart';

final signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
  (ref) => SignInViewModel(auth: ref.watch(firebaseAuthProvider)),
);

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final signInViewModel = watch(signInModelProvider);
    return ProviderListener<SignInViewModel>(
      onChange: (context, model) async {},
      provider: signInModelProvider,
      child: SignInPageContents(viewModel: signInViewModel),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents({Key? key, required this.viewModel}) : super(key: key);
  final SignInViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredButton(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          buttonText: 'Sign In Anonymously',
          color: Colors.pink[200]!,
          onPressed: () async {
            await viewModel.signInAnonymously();
          },
        ),
      ),
    );
  }
}
