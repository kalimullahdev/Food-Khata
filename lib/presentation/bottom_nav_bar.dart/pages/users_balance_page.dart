import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_khata/blocs/food_khata/users_balance/users_balance_bloc.dart';
import 'package:food_khata/injection.dart';

class UsersBalancePage extends StatelessWidget {
  const UsersBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<UsersBalanceBloc>()..add(const UsersBalanceEvent.started()),
      child: const UsersBalanceForm(),
    );
  }
}

class UsersBalanceForm extends StatelessWidget {
  const UsersBalanceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBalanceBloc, UsersBalanceState>(
      builder: (context, state) {
        const greenIcon = Icon(
          Icons.circle,
          size: 18,
          color: Colors.green,
        );
        const redIcon = Icon(
          Icons.circle,
          size: 18,
          color: Colors.red,
        );
        return ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Ikarm"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Rs. ${state.ikramBalance == 0 ? "loading" : state.ikramBalance}"),
                    const SizedBox(width: 12),
                    if (state.ikramBalance <= 0) redIcon else greenIcon,
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Kalim ullah"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Rs. ${state.kalimBalance == 0 ? "loading" : state.kalimBalance}"),
                    const SizedBox(width: 12),
                    if (state.kalimBalance <= 0) redIcon else greenIcon,
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Nafay"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Rs. ${state.nafayBalance == 0 ? "loading" : state.nafayBalance}"),
                    const SizedBox(width: 12),
                    if (state.nafayBalance <= 0) redIcon else greenIcon,
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Umair"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Rs. ${state.umairBalance == 0 ? "loading" : state.umairBalance}"),
                    const SizedBox(width: 12),
                    if (state.umairBalance <= 0) redIcon else greenIcon,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
