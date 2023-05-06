import 'package:online_store_application/data/models/details_phone.dart';
import 'package:online_store_application/ui/app.dart';

abstract class DetailsRepository {
  const DetailsRepository();

  Future<DetailPhone> loadDetPhones();
}

class ConstDetailsRepository extends DetailsRepository {
  const ConstDetailsRepository();

  @override
  Future<DetailPhone> loadDetPhones() async {
    try {
      final responce = await dio
          .get('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
      final detailsPhones = DetailPhone.fromJson(responce.data);
      return detailsPhones;
    } catch (e) {
      throw Exception('Loading error in repository: $e');
    }
  }
}
