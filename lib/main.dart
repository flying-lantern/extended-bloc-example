import 'dart:developer';
import 'extended_base/extended_base_bloc.dart';
import 'widgets/registration_bloc_consumer.dart';
import 'extended_impl/extended_impl_bloc.dart';
import 'registration/registration_bloc.dart';
import 'registration/registration_step/registration_step_bloc.dart';
import 'widgets/cc_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const BlocDemo());
}

class BlocDemo extends StatelessWidget {
  const BlocDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extended Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoaderOverlay(
          child: _BlocDemo() //MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}

class _BlocDemo extends StatelessWidget {
  const _BlocDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extended Bloc Demo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              _ExtendedImplBlocWidget(),
              _ExtendedBaseBlocWidget(),
              _RegistrationBlocWidget(),
              _RegistrationStepBlocWidget(),
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ExtendedImplBlocWidget extends StatelessWidget {
  const _ExtendedImplBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExtendedImplBloc>(
      create: (_) => ExtendedImplBloc(),
      child: CCBlocConsumer<ExtendedImplBloc, ExtendedImplState>(
        listener: (context, state) =>
            log('Listener for ExtendedImplBloc called'),
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () => context
                .read<ExtendedImplBloc>()
                .add(const CustomExtendedImplEvent(eventProperty: 'test')),
            child: const Text('ExtendedImplBloc'),
          );
        },
      ),
    );
  }
}

class _ExtendedBaseBlocWidget extends StatelessWidget {
  const _ExtendedBaseBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExtendedBaseBloc>(
      create: (_) => ExtendedBaseBloc(),
      child: CCBlocConsumer<ExtendedBaseBloc, ExtendedBaseState>(
        listener: (context, state) =>
            log('Listener for ExtendedImplBloc called'),
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () =>
                context.read<ExtendedBaseBloc>().add(const ExtendedBaseEvent()),
            child: const Text('ExtendedBaseBloc'),
          );
        },
      ),
    );
  }
}

class _RegistrationBlocWidget extends StatelessWidget {
  const _RegistrationBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (_) => RegistrationBloc(),
      child: RegistrationBlocConsumer<RegistrationBloc>(
        listener: (context, state) =>
            log('Listener for RegistrationBloc called'),
        builder: (context, state) => ElevatedButton(
          onPressed: () =>
              context.read<RegistrationBloc>().add(const AgeChanged(age: 4)),
          child: const Text('RegistrationBloc'),
        ),
      ),
    );
  }
}

class _RegistrationStepBlocWidget extends StatelessWidget {
  const _RegistrationStepBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationStepBloc>(
      create: (context) => RegistrationStepBloc(),
      child: RegistrationBlocConsumer<RegistrationStepBloc>(
        listener: (context, state) =>
            log('Listener for RegistrationStepBloc called'),
        builder: (context, state) => ElevatedButton(
          onPressed: () => context
              .read<RegistrationStepBloc>()
              .add(const FirstNameChanged(name: '')),
          child: const Text('RegistrationStepBloc'),
        ),
      ),
    );
  }
}

// class _MyHomePage extends StatefulWidget {
//   const _MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<_MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<_MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: BlocProvider<ExtendedImplBloc>(
//         create: (context) => ExtendedImplBloc(),
//         child: BlocBuilder<ExtendedImplBloc, ExtendedImplState>(
//           builder: (context, state) {
//             return SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text(
//                       'You have pushed the button this many times:',
//                     ),
//                     Text(
//                       '$_counter',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                     TextButton(
//                         onPressed: () => context.read<ExtendedImplBloc>().add(
//                             const CustomExtendedImplEvent(
//                                 eventProperty: 'test')),
//                         child: const Text('Click me')),
//                     const _TestWidget<ExtendedImplBloc, ExtendedImplState>(),
//                     Text('Extended val: ${state.extendedProperty}'),
//                     CCBlocConsumer<ExtendedImplBloc, ExtendedImplState>(
//                         listener: (context, state) {},
//                         builder: (context, state) {
//                           return TextButton(
//                             onPressed: () => context
//                                 .read<ExtendedImplBloc>()
//                                 .add(const CustomExtendedImplEvent(
//                                     eventProperty: '')),
//                             child: const Text('CCBlocConsumer'),
//                           );
//                         }),
//                     const _TestWidgetTwo(),
//                     BlocProvider<RegistrationStepBloc>(
//                       create: (context) => RegistrationStepBloc(),
//                       child: const _RegistrationStepBlocWidget(),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class _TestWidgetTwo extends StatelessWidget {
//   const _TestWidgetTwo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ExtendedBaseBloc>(
//       create: (context) => ExtendedBaseBloc(),
//       child: CCBlocConsumer<ExtendedBaseBloc, ExtendedBaseState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Container(
//             color: Colors.purple,
//             height: 100,
//             width: 100,
//             child: TextButton(
//               onPressed: () =>
//                   context.read<ExtendedBaseBloc>().add(const ClearError()),
//               child: const Text('Test Widget Two',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   )),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _TestWidget<B extends StateStreamable<S>, S extends CCBaseStateImpl>
//     extends StatelessWidget {
//   const _TestWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<B, S>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Text('${state.errorCode}');
//         });
//   }
// }
