part of 'community_image_bloc.dart';

@CopyWith(skipFields: true)
class CommunityImageState extends Equatable {
  final List<String> images;

  CommunityImageState({this.images = const []});

  @override
  List<Object> get props => [images];
}
