// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:weather_app/core/network/network_info.dart' as _i866;
import 'package:weather_app/core/services/preferences_service.dart' as _i132;
import 'package:weather_app/features/weather/data/datasources/weather_remote_datasource.dart'
    as _i133;
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i530;
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart'
    as _i504;
import 'package:weather_app/features/weather/domain/usecases/get_daily_weather.dart'
    as _i634;
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart'
    as _i129;
import 'package:weather_app/features/weather/presentation/provider/weather_provider.dart'
    as _i163;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i866.NetworkHelper>(() => _i866.NetworkHelper());
    gh.lazySingleton<_i132.PreferencesService>(
        () => _i132.PreferencesService());
    gh.lazySingleton<_i133.WeatherRemoteDataSource>(
        () => _i133.WeatherRemoteDataSourceImpl(gh<_i866.NetworkHelper>()));
    gh.lazySingleton<_i504.WeatherRepository>(
        () => _i530.WeatherRepositoryImpl(gh<_i133.WeatherRemoteDataSource>()));
    gh.lazySingleton<_i129.GetWeather>(
        () => _i129.GetWeather(gh<_i504.WeatherRepository>()));
    gh.lazySingleton<_i634.GetDailyWeather>(
        () => _i634.GetDailyWeather(gh<_i504.WeatherRepository>()));
    gh.factory<_i163.WeatherProvider>(() => _i163.WeatherProvider(
          gh<_i129.GetWeather>(),
          gh<_i634.GetDailyWeather>(),
          gh<_i132.PreferencesService>(),
        ));
    return this;
  }
}
