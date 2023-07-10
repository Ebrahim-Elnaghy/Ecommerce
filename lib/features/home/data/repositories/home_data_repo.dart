import '../../domain/repositories/home_domain_repo.dart';
import '../datasources/home_data_sources.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo({required this.homeDataSources});
}
