part of 'find_bloc.dart';

sealed class FindCategoryEvent extends Equatable {
  const FindCategoryEvent();

  @override
  List<Object> get props => [];
}

final class FindCategory extends FindCategoryEvent {
  final String slug;

  const FindCategory({
    required this.slug,
  });

  @override
  List<Object> get props => [slug];
}
