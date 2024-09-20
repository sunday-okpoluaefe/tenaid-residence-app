part of 'community_image_bloc.dart';

sealed class CommunityImageEvent extends Equatable {
  const CommunityImageEvent();
}

class OnImageAdded extends CommunityImageEvent {
  final String path;

  OnImageAdded(this.path);

  @override
  List<Object?> get props => [path];
}

class OnRemoveImage extends CommunityImageEvent {
  final int index;

  OnRemoveImage(this.index);

  @override
  List<Object?> get props => [index];
}

class OnEditImage extends CommunityImageEvent {
  final int index;
  final String path;

  OnEditImage({required this.index, required this.path});

  @override
  List<Object?> get props => [index, path];
}
