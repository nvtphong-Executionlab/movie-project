
import 'package:movie_project/Data/Models/ListCastModel.dart';

abstract class CastDataSource {
  Future<CreditModel> getCasts(String apiLink);
}