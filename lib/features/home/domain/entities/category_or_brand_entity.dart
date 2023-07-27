// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CategoryOrBrandEntity extends Equatable {
  CategoryOrBrandEntity({
    this.results,
    this.data,
  });

  int? results;
  List<DataEntity>? data;

  @override
  List<Object?> get props => [results, data];
}

class DataEntity extends Equatable {
  DataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

  @override
  List<Object?> get props => [id, name, slug, image];
}
