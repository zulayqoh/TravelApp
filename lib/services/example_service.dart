import 'package:travel_app_sample/app_model/example_model.dart';
import 'package:travel_app_sample/network/network_provider.dart';

import '../helpers/error_reporter.dart';

class ExampleService {
  final NetworkProvider _networkProvider;

  ExampleService({NetworkProvider? networkProvider})
      : _networkProvider = networkProvider ??
            NetworkProvider(baseUrl: "http://mark.bslmeiyu.com/api");

  Future<List<ExampleModel>> getData() async {
    List<ExampleModel> exampleModel = <ExampleModel>[];
    try {
      final apiResponse = await _networkProvider
          .call("/getplaces", RequestMethod.get, showLog: true);
      if (apiResponse.statusCode == 200) {
        List<dynamic> listData = apiResponse.data;
        exampleModel = welcomeFromJson(listData);
        return exampleModel;
        // return listData.map((e) => ExampleModel.fromJson(e)).toList();
      } else {
        throw Exception();
        // OR you
        // return exampleModel;
      }
    } catch (error, stackTrace) {
      ErrorReporter().reportError(error, stackTrace);
      return exampleModel;
    }
  }
}
