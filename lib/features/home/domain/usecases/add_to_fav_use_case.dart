import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/fev_entity.dart';
import '../repositories/home_domain_repo.dart';

class AddToFavUseCase{
  HomeDomainRepo homeDomainRepo;
  AddToFavUseCase(this.homeDomainRepo);
  Future<Either<Failures,FavEntity>>call(String productId)=>homeDomainRepo.addToFav(productId);
}