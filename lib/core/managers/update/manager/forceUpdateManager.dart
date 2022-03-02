import 'package:flutter/cupertino.dart';

import '../../network/customDio/requestTypeEnum.dart';
import '../../network/networkManager.dart';
import '../extension/versionCheckQuery.dart';
import '../models/forceUpdateModel.dart';

abstract class IUpdateManager {
  final NetworkManager networkManager;

  IUpdateManager(this.networkManager);

  Future<void> checkUpdates(String version, String platform);
}

class ForceUpdateManager extends IUpdateManager with ChangeNotifier {
  ForceUpdateManager(networkManager) : super(networkManager);

  static bool isAvailableForceUpdate = false;
  static bool isAvailableUnforceUpdate = false;

  @override
  Future<void> checkUpdates(String version, String platform) async {
    final response = await networkManager.client
        ?.sendRequest<ForceUpdateModel, ForceUpdateModel>(
      "/version",
      type: RequestType.GET,
      parseModel: ForceUpdateModel(),
      queryParameters: Map.fromEntries(
        [
          VersionQuery.VERSION.mapper(version),
          VersionQuery.PLATFORM.mapper(platform),
        ],
      ),
    );

    if (response?.data != null) {
      isAvailableForceUpdate = response!.data!.isForceUpdate ?? false;

      if (response.data!.currentVersion != version &&
          response.data!.isForceUpdate == false) {
        isAvailableUnforceUpdate = true;
      } else {
        isAvailableUnforceUpdate = false;
      }
    }

    notifyListeners();
  }
}
