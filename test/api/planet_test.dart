import "dart:convert";
import "dart:io";

import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";
import "package:http_mock_adapter/http_mock_adapter.dart";
import "package:http_mock_adapter/src/handlers/request_handler.dart";
import "package:swapiinfo/data/api/planet_response.dart";
import "package:swapiinfo/data/api/service.dart";
import "package:swapiinfo/data/http/client.dart";
import "package:swapiinfo/data/http/constants.dart";
import "package:swapiinfo/data/http/status_code_ext.dart";

final GetIt getIt = GetIt.instance;

void main() {
  group("Planet APIs", () {
    setUpAll(() async {
      const String baseUrl = kBaseUrl;

      final BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        validateStatus: (int? status) => status.isSuccess,
        contentType: "application/json; charset=utf-8",
        connectTimeout: kDefaultConnectTimeout,
        receiveTimeout: kDefaultReceiveTimeout,
        sendTimeout: kDefaultSendTimeout,
      );

      //Setup

      final Dio dio = Dio(options);
      final DioAdapter dioAdapter = DioAdapter(dio: dio);

      final File file = File("test_resources/planet.json");
      final dynamic json = jsonDecode(await file.readAsString());

      dioAdapter.onGet(
          "planets/1",
          (MockServer server) => server.reply(200, json as Map<String, dynamic>,
              delay: const Duration(seconds: 1)));

      getIt.registerSingleton<Dio>(dio);
      getIt.registerFactory<ApiClient>(() => ApiClient(dio));
    });

    // This test ensures that no JSON mapping is incorrect
    // The test should be failed if there is any wrong JSON mapping
    test(
        "When requesting for get planet by id 1, return successful response by checking name is not empty",
        () async {
      final ApiService service = ApiService(getIt.get<ApiClient>());

      final PlanetResponse data = await service.getPlanet("1").single;

      expect(data.name, isNotEmpty);
    });
  });
}
