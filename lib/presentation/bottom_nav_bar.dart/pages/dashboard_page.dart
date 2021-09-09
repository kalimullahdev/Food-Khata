import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_khata/blocs/food_khata/dashboard/dashboard_bloc.dart';
import 'package:food_khata/presentation/widgets/custom_progress_indicator.dart';
import 'package:food_khata/presentation/widgets/custom_text.dart';
import 'package:food_khata/injection.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DashboardBloc>()..add(const DashboardEvent.started()),
      child: const DashboardWidget(),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        context.read<DashboardBloc>().add(const DashboardEvent.started());
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: "Total balance"),
              const SizedBox(height: 16),
              state.map(
                initial: (value) => const CustomCircularProgressIndicator(),
                totalBalance: (value) => Text(
                  "Rs. ${value.balance}",
                  style: const TextStyle(fontSize: 33),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



//    flutter packages pub run build_runner build --delete-conflicting-outputs  
