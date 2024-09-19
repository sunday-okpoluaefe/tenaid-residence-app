part of 'onboarding_screen_bloc.dart';

sealed class OnboardingScreenState extends Equatable {
  const OnboardingScreenState();
}

final class OnboardingScreenInitial extends OnboardingScreenState {
  @override
  List<Object> get props => [];
}
