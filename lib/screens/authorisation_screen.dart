import 'package:flutter/material.dart';
import 'package:roonyx/blocs/authorisation_cubit.dart';
import 'package:roonyx/blocs/authorisation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roonyx/widgets/response_widgets.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController editingController = TextEditingController();
  late AuthorisationCubit _bloc;
  final _key = GlobalKey<FormState>();
  bool isScreenLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = Provider.of<AuthorisationCubit>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorization screen'),
        centerTitle: true,
        backgroundColor: const Color(0xFF005CFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<AuthorisationCubit, AuthorisationState>(
          builder: (context, state) {
            //check if current state is loading
            if (state is AuthorisationLoading) {
              isScreenLoading = true;
            } else {
              isScreenLoading = false;
            }
            return Column(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Enter your PIN',
                      style: TextStyle(fontSize: 20, color: Color(0xff122242)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _key,
                      child: TextFormField(
                        controller: editingController,
                        autofocus: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field required';
                          } else if (value!.length < 4) {
                            return 'pin must be least 4 digits';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 10),
                          hintText: 'Enter your pin',
                          hintStyle: const TextStyle(
                              color: Color(0XFF414E68), fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 0,
                              color: Color(0XFF414E68),
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (state is AuthorisationSuccess) const SuccessWidget(),
                    if (state is AuthorisationFailed) const FailureWidget()
                  ],
                )),
                InkWell(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      _bloc.authoriseUser(editingController.value.text);
                    }
                  },
                  child: Container(
                    color: const Color(0xFF005CFF),
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: isScreenLoading
                          ? ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 30, height: 30),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Authorize',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    editingController.dispose();
    super.dispose();
  }
}
