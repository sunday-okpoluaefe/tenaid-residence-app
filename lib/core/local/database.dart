import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

import '../../library/community/data/data_source/community_local_datasource.dart';

Future<void> setupDatabase() async {
  final appDirectory = await path.getApplicationDocumentsDirectory();

  // initialise local database
  Hive.init(appDirectory.path);

  // communities store
  CommunityBox = await Hive.openLazyBox('communityBox');
  VisitorBox = await Hive.openLazyBox('visitorBox');
}
