import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_khata/blocs/auth/auth_bloc.dart';
import 'package:food_khata/blocs/food_khata/group_transaction/group_transaction_bloc.dart';
import 'package:food_khata/injection.dart';
import 'package:food_khata/presentation/pages/home_page.dart';
import 'package:food_khata/presentation/widgets/custom_button.dart';
import 'package:food_khata/presentation/widgets/custom_text_form_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class KhataPage extends StatelessWidget {
  const KhataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Khata Page"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Row(
                    children: const [
                      Icon(
                        Icons.logout,
                      ),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                  content: const Text('Are you sure you want to Logout?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Color(0xffff6347)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.signedOut());
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Color(0xffff6347),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<GroupTransactionBloc>(),
        child: const KhataForm(),
      ),
    );
  }
}

class KhataForm extends StatefulWidget {
  const KhataForm({Key? key}) : super(key: key);

  @override
  _KhataFormState createState() => _KhataFormState();
}

class _KhataFormState extends State<KhataForm> {
  final amountController = TextEditingController();
  bool showErorsMessage = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: BlocBuilder<GroupTransactionBloc, GroupTransactionState>(
          builder: (context, state) => Form(
            key: _formKey,
            child: Column(
              children: [
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  initialLabelIndex: (state.debit) ? 0 : 1,
                  activeBgColors: const [
                    [Colors.green],
                    [Color(0xffff6347)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.black26,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ['Debit', 'Credit'],
                  onToggle: (index) {
                    context.read<GroupTransactionBloc>().add(
                          GroupTransactionEvent.debitTransaction(
                              isDebited: !index.isOdd),
                        );
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  textFieldController: amountController,
                  showErorsMessage: showErorsMessage,
                  keyboardType: TextInputType.number,
                  labelText: "Enter amount",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter amount";
                    }
                    return null;
                  },
                  iconData: Icons.money,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  value: state.kalimChecked,
                  title: const Text("Kalim"),
                  activeColor: Color(0xffff6347),
                  onChanged: (value) => {
                    context
                        .read<GroupTransactionBloc>()
                        .add(GroupTransactionEvent.kalimCheckBoxChange(
                          checked: value ?? state.kalimChecked,
                        )),
                  },
                ),
                CheckboxListTile(
                  value: state.nafayChecked,
                  title: const Text("Nafay"),
                  activeColor: const Color(0xffff6347),
                  onChanged: (value) => {
                    context
                        .read<GroupTransactionBloc>()
                        .add(GroupTransactionEvent.nafayheckBoxChange(
                          checked: value ?? state.nafayChecked,
                        )),
                  },
                ),
                CheckboxListTile(
                  value: state.ikramChecked,
                  activeColor: const Color(0xffff6347),
                  title: const Text("Ikram"),
                  onChanged: (value) => {
                    context
                        .read<GroupTransactionBloc>()
                        .add(GroupTransactionEvent.ikramCheckBoxChange(
                          checked: value ?? state.ikramChecked,
                        )),
                  },
                ),
                CheckboxListTile(
                  value: state.umairChecked,
                  title: const Text("Umair"),
                  activeColor: const Color(0xffff6347),
                  onChanged: (value) => {
                    context
                        .read<GroupTransactionBloc>()
                        .add(GroupTransactionEvent.umairCheckBoxChange(
                          checked: value ?? state.umairChecked,
                        )),
                  },
                ),
                if (state.checkBoxFailure)
                  const Text(
                    "Please choose at least one checkbox",
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 16),
                CustomButton(
                  buttonText: "Make Transaction",
                  onPressed: () {
                    _formKey.currentState!.validate();
                    context.read<GroupTransactionBloc>().add(
                          GroupTransactionEvent.makeTransaction(
                            amount: int.parse(
                                amountController.text.toString().trim()),
                          ),
                        );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
