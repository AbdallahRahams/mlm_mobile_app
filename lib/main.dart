import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/user/user_bloc.dart';
import '../presentation/bloc/network/network_bloc.dart';
import '../presentation/bloc/earnings/earnings_bloc.dart';
import '../presentation/bloc/referral/referral_bloc.dart';
import '../presentation/bloc/order/order_bloc.dart';
import '../presentation/bloc/product/product_bloc.dart';
import '../presentation/bloc/analytics/analytics_bloc.dart';
import '../presentation/bloc/wholesaler/wholesaler_bloc.dart';
import '../presentation/bloc/payment/payment_bloc.dart';
import '../presentation/bloc/payment/payment_event.dart';
import '../presentation/bloc/task/task_bloc.dart';
import '../presentation/bloc/services/services_bloc.dart';
import '../presentation/bloc/services/services_event.dart';
import '../presentation/bloc/services/services_state.dart';// Import your service repository
import 'presentation/bloc/rank/rank_bloc.dart';
import 'routes.dart';

void main() async {
  // Initialize Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables for Stripe secret key
  await dotenv.load(fileName: "assets/.env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<UserBloc>(create: (_) => UserBloc()),
        BlocProvider<NetworkBloc>(create: (_) => NetworkBloc()),
        BlocProvider<EarningsBloc>(create: (_) => EarningsBloc()),
        BlocProvider<ReferralBloc>(create: (_) => ReferralBloc()),
        BlocProvider<OrderBloc>(create: (_) => OrderBloc()),
        BlocProvider<ProductBloc>(create: (_) => ProductBloc()),
        BlocProvider<AnalyticsBloc>(create: (_) => AnalyticsBloc()),
        BlocProvider<WholesalerBloc>(create: (_) => WholesalerBloc()),
        BlocProvider<TaskBloc>(create: (_) => TaskBloc()..add(LoadTasksEvent())),
        BlocProvider<PaymentBloc>(create: (_) => PaymentBloc()..add(LoadPaymentMethods())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Network Marketing App',
        initialRoute: '/home',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
