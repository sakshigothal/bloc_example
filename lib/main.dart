import 'package:bloc_example/Blocs/switchBloc/switch_bloc.dart';
import 'package:bloc_example/Models/task_model.dart';
import 'package:bloc_example/Services/app_router.dart';
import 'package:bloc_example/Services/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'Blocs/TaskBloc/task_bloc.dart';
import 'Blocs/counterBloc/counter_bloc.dart';
import 'Screens/tabs_screen.dart';
import 'Screens/pending_screen.dart';
import 'Screens/counter_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        // BlocProvider(create: (context) => CounterBloc()),
      ],
      // create: (context) => TaskBloc(),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/*class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key,required this.title}) : super(key: key);

  final _bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: _bloc.counter,
              initialData: 0,
              builder: (BuildContext context,AsyncSnapshot snapshot){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                );
              })
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: ()=> _bloc.counterEventSink.add(IncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: ()=> _bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}*/
