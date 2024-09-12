import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/user/user_bloc.dart';
import '../presentation/bloc/network/network_bloc.dart';
import '../presentation/bloc/earnings/earnings_bloc.dart';
import '../presentation/bloc/referral/referral_bloc.dart';
import '../presentation/bloc/order/order_bloc.dart';
import '../presentation/bloc/product/product_bloc.dart';
import '../presentation/bloc/analytics/analytics_bloc.dart';
import '../presentation/bloc/wholesaler/wholesaler_bloc.dart';
import 'routes.dart';


void main() {
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Network Marketing App',
        initialRoute: '/signin',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}