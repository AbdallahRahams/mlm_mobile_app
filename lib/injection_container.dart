import 'package:get_it/get_it.dart';
import 'package:mlm_mobile_app/data/datasources/local/local_data_source.dart';
import 'package:mlm_mobile_app/data/datasources/remote/remote_data_source.dart';
import 'package:mlm_mobile_app/data/repositories/user_repository_impl.dart';
import 'package:mlm_mobile_app/data/repositories/network_repository_impl.dart';
import 'package:mlm_mobile_app/domain/repositories/user_repository.dart';
import 'package:mlm_mobile_app/domain/repositories/network_repository.dart';
import 'package:mlm_mobile_app/domain/usecases/get_user_info.dart';
import 'package:mlm_mobile_app/domain/usecases/get_network_details.dart';
import 'package:mlm_mobile_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:mlm_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:mlm_mobile_app/presentation/presentation.dart';
import 'data/repositories/analytics_repository_impl.dart';
import 'data/repositories/earnings_repository_impl.dart';
import 'data/repositories/order_repository_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'data/repositories/referral_repository_impl.dart';
import 'data/repositories/wholesaler_repository_impl.dart';
import 'domain/repositories/analytics_repository.dart';
import 'domain/repositories/earnings_repository.dart';
import 'domain/repositories/order_repository.dart';
import 'domain/repositories/product_repository.dart';
import 'domain/repositories/referral_repository.dart';
import 'domain/repositories/wholesaler_repository.dart';
import 'domain/usecases/get_analytics.dart';
import 'domain/usecases/get_earnings.dart';
import 'domain/usecases/get_referral_count.dart';
import 'domain/usecases/get_top_referrers.dart';
import 'domain/usecases/manage_orders.dart';
import 'domain/usecases/manage_products.dart';
import 'domain/usecases/manage_wholesalers.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => AuthBloc());
  sl.registerFactory(() => UserBloc());
  sl.registerFactory(() => NetworkBloc());
  sl.registerFactory(() => EarningsBloc());
  sl.registerFactory(() => ReferralBloc());
  sl.registerFactory(() => OrderBloc());
  sl.registerFactory(() => ProductBloc());
  sl.registerFactory(() => AnalyticsBloc());
  sl.registerFactory(() => WholesalerBloc());

  // Use cases
  sl.registerLazySingleton(() => GetUserInfo(sl()));
  sl.registerLazySingleton(() => GetNetworkDetails(sl()));
  sl.registerLazySingleton(() => GetEarnings(sl()));
  sl.registerLazySingleton(() => GetReferralCount(sl()));
  sl.registerLazySingleton(() => ManageOrders(sl()));
  sl.registerLazySingleton(() => ManageProducts(sl()));
  sl.registerLazySingleton(() => GetAnalytics(sl()));
  sl.registerLazySingleton(() => GetTopReferrers(sl()));
  sl.registerLazySingleton(() => ManageWholesalers(sl()));


  // Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<NetworkRepository>(() => NetworkRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<EarningsRepository>(() => EarningsRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<ReferralRepository>(() => ReferralRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<AnalyticsRepository>(() => AnalyticsRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<WholesalerRepository>(() => WholesalerRepositoryImpl(
    localDataSource: sl(), remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSource());

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(
  'https://your-api-base-url.com',
));


  // Other services, like shared preferences, network info, etc.
  // Example:
  // sl.registerLazySingleton(() => SharedPreferences.getInstance());
}