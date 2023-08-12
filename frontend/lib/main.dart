import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Workout Tracker"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class WorkoutTaskList extends StatefulWidget {
  final Map<String, bool> workoutTaskToState;

  const WorkoutTaskList({
    super.key,
    required this.workoutTaskToState,
  });

  @override
  _WorkoutTaskListState createState() => _WorkoutTaskListState();
}

class _WorkoutTaskListState extends State<WorkoutTaskList> {
  @override
  Widget build(BuildContext context) {
    var workoutTasks = widget.workoutTaskToState.entries.toList();

    return ListView.builder(
      itemCount: workoutTasks.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          value: widget.workoutTaskToState[workoutTasks[index].key],
          onChanged: (value) {
            setState(() {
              widget.workoutTaskToState[workoutTasks[index].key] = value!;
            });
          },
          title: Text(workoutTasks[index].key),
        );
      },
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Map<String, bool> workoutTaskToState = {
    'Task 1': true,
    'Task 2': false,
    'Task 3': true,
  };

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var workoutTasks = workoutTaskToState.entries.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          children: [WorkoutTaskList(workoutTaskToState: workoutTaskToState)]),
      // Floating action button to add a new workout task
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
