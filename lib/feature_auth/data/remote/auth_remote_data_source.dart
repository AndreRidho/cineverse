import 'package:cineverse/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(
    Dio dio, {
    String baseUrl,
  }) = _AuthRemoteDataSource;

  @GET('/authentication/token/new')
  Future createRequestToken({
    @Query('api_key') required String apiKey,
  });

  @POST('/authentication/token/validate_with_login')
  Future validateWithLogin({
    @Query('api_key') required String apiKey,
    @Body() required Map<String, dynamic> credentials,
  });

  @POST('/authentication/session/new')
  Future createSession({
    @Query('api_key') required String apiKey,
    @Body() required Map<String, dynamic> requestToken,
  });

  @DELETE('/authentication/session')
  Future deleteSession({
    @Query('api_key') required String apiKey,
    @Body() required Map<String, dynamic> sessionId,
  });

  @GET('/account')
  Future getAccountDetails({
    @Query('session_id') required String sessionId,
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  // Configuration
  @GET('/configuration')
  Future getApiConfiguration();

  @GET('/configuration/languages')
  Future getLanguages({
    @Header('Authorization') String auth = 'Bearer $kAccessToken',
  });

  @GET('/configuration/countries')
  Future getCountries();

  @GET('/configuration/timezones')
  Future getTimezones();
}
