import 'package:example_extended_bloc/cc_base/cc_base_bloc.dart';
import 'package:example_extended_bloc/extended/extended_bloc.dart';
import 'package:example_extended_bloc/widgets/cc_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoaderOverlay(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider<ExtendedBloc>(
        create: (context) => ExtendedBloc(),
        child: BlocBuilder<ExtendedBloc, ExtendedState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                      onPressed: () => context
                          .read<ExtendedBloc>()
                          .add(const CustomExtendedEvent(eventProp: 'test')),
                      child: const Text('Click me')),
                  const TestWidget<ExtendedBloc, ExtendedState>(),
                  Text('Extended val: ${state.extendedProperty}'),
                  CCBlocConsumer<ExtendedBloc, ExtendedState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () => context
                              .read<ExtendedBloc>()
                              .add(const CustomExtendedEvent(eventProp: '')),
                          child: const Text('CCBlocConsumer'),
                        );
                      }),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TestWidget<B extends StateStreamable<S>, S extends CCBaseState>
    extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(listener: (context, state) {
      print('State changed');
    }, builder: (context, state) {
      return Text('${state.errorCode}');
    });
  }
}
