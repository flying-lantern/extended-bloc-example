import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../cc_base_impl/cc_base_bloc_impl.dart';

class CCBlocConsumer<B extends StateStreamable<S>, S extends CCBaseState>
    extends StatelessWidget {
  const CCBlocConsumer({
    super.key,
    required this.builder,
    this.listener,
  });

  final Widget Function(BuildContext, S) builder;
  final void Function(BuildContext, S)? listener;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: (context, state) {
        if (state.status.isInProgress) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state.status.isFailure) {
          _simpleDialog(context);
        }

        listener?.call(context, state);
      },
      builder: builder,
    );
  }
}

Future<void> _simpleDialog(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('An error occurred. Please try again later.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
