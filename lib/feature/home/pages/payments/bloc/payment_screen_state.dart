part of 'payment_screen_bloc.dart';

sealed class PaymentScreenState extends Equatable {
  const PaymentScreenState();
}

final class PaymentScreenInitial extends PaymentScreenState {
  @override
  List<Object> get props => [];
}
