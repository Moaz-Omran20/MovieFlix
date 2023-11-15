// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteMovieModelAdapter extends TypeAdapter<FavouriteMovieModel> {
  @override
  final int typeId = 1;

  @override
  FavouriteMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteMovieModel(
      id: fields[0] as num,
      backdropPath: fields[1] as String,
      title: fields[2] as String,
      date: fields[3] as String,
      rating: fields[4] as num,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteMovieModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
