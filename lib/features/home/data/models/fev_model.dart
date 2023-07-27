import '../../domain/entities/fev_entity.dart';

class FavModel extends FavEntity {
  FavModel({
    this.status,
    super.message,
    this.data,
  });

  FavModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? status;
  List<String>? data;
}
