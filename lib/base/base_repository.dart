import 'package:aaj_tak/app/data/network/network_requester.dart';
import 'package:get/get.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
