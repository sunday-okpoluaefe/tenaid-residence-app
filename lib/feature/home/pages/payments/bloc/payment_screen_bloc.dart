import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'payment_screen_event.dart';
part 'payment_screen_state.dart';

@injectable
class PaymentScreenBloc extends Bloc<PaymentScreenEvent, PaymentScreenState> {
  PaymentScreenBloc() : super(PaymentScreenInitial()) {
    on<PaymentScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
