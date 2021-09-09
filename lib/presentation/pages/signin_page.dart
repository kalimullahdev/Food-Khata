import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_khata/blocs/auth/auth_bloc.dart';
import 'package:food_khata/blocs/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:food_khata/injection.dart';
import 'package:food_khata/presentation/bottom_nav_bar.dart/pages/khata_page.dart';
import 'package:food_khata/presentation/widgets/custom_button.dart';
import 'package:food_khata/presentation/widgets/custom_progress_indicator.dart';
import 'package:food_khata/presentation/widgets/custom_text_form_field.dart';
import 'package:food_khata/presentation/widgets/custom_text.dart';
import 'package:food_khata/presentation/widgets/logo_image.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => getIt<SignInFormBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ], child: const SignInForm()),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) => state.map(
        initial: (value) {},
        authenticated: (value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const KhataPage(),
          ),
        ),
        unauthenticated: (value) => {},
      ),
      builder: (context, authtate) => authtate.map(
        initial: (value) =>
            const Center(child: CustomCircularProgressIndicator()),
        authenticated: (value) => Container(),
        unauthenticated: (value) =>
            BlocConsumer<SignInFormBloc, SignInFormState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final snackBar = SnackBar(
                    content: failure.map(
                      cancelledByUser: (_) => const Text('Cancelled'),
                      serverError: (_) => const Text('Server error'),
                      emailAlreadyInUse: (_) =>
                          const Text('Email already in use'),
                      invalidEmailAndPasswordCombination: (_) =>
                          const Text('Invalid email and password combination'),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                (_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KhataPage(),
                      ),
                      (route) => false);
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.authCheckRequested());
                },
              ),
            );
          },
          builder: (context, state) {
            return Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LogoImage(),
                    const CustomText(
                      text: "Food Khata",
                    ),
                    const SizedBox(height: 32),
                    emailFormField(showErorsMessage: state.showErrors),
                    const SizedBox(height: 8),
                    passwordFormField(showErorsMessage: state.showErrors),
                    const SizedBox(height: 8),
                    signInButton(context),
                    if (state.isSubmitting)
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 300,
                        child: const LinearProgressIndicator(
                          color: Color(0xffFF8C00),
                          backgroundColor: Color(0xffff6347),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  CustomButton signInButton(BuildContext context) {
    return CustomButton(
      buttonText: "Sign In",
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<SignInFormBloc>().add(
                SignInFormEvent.signInWithEmailAndPasswordPressed(
                  email: emailController.text.toLowerCase().toString(),
                  password: passwordController.text.toString(),
                ),
              );
        } else {
          context.read<SignInFormBloc>().add(
                const SignInFormEvent.changeShowErrorMessage(
                  showMessages: true,
                ),
              );
        }
      },
    );
  }

  Widget emailFormField({bool showErorsMessage = false}) {
    return SizedBox(
      width: 280,
      child: CustomTextFormField(
        textFieldController: emailController,
        showErorsMessage: showErorsMessage,
        keyboardType: TextInputType.emailAddress,
        labelText: "Enter email address",
        iconData: Icons.email,
        validator: (value) {
          final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ).hasMatch(emailController.text);
          if (value!.isEmpty) {
            return 'Email cannot be empty';
          } else if (!emailValid) {
            return 'Email is not valid.';
          }
          return null;
        },
      ),
    );
  }

  Widget passwordFormField({bool showErorsMessage = false}) {
    print("${showErorsMessage.toString()} erros");
    return SizedBox(
      width: 280,
      child: CustomTextFormField(
          textFieldController: passwordController,
          showErorsMessage: showErorsMessage,
          labelText: "Enter password",
          iconData: Icons.password,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'password cannot be empty';
            } else if (value.length < 8) {
              return 'password must be greater than 8 characters.';
            }
            return null;
          }),
    );
  }
}
