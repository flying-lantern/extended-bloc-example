import 'cc_base_impl/cc_base_bloc_impl.dart';
import 'extended_impl/extended_impl_bloc.dart';
import 'widgets/cc_bloc_consumer.dart';
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
      body: BlocProvider<ExtendedImplBloc>(
        create: (context) => ExtendedImplBloc(),
        child: BlocBuilder<ExtendedImplBloc, ExtendedImplState>(
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
                      onPressed: () => context.read<ExtendedImplBloc>().add(
                          const CustomExtendedImplEvent(eventProp: 'test')),
                      child: const Text('Click me')),
                  const TestWidget<ExtendedImplBloc, ExtendedImplState>(),
                  Text('Extended val: ${state.extendedProperty}'),
                  CCBlocConsumer<ExtendedImplBloc, ExtendedImplState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () => context.read<ExtendedImplBloc>().add(
                              const CustomExtendedImplEvent(eventProp: '')),
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

class TestWidget<B extends StateStreamable<S>, S extends CCBaseStateImpl>
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
