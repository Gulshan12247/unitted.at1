import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define your providers
final counterProvider = StateProvider<int>((ref) => 0);
final setNameProvider = StateProvider<String?>((ref) => null);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the counter and name from the providers
    final counter = ref.watch(counterProvider);
    final name = ref.watch(setNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter'),
            SizedBox(height: 20),
            Text('Name: ${name ?? 'No Name Set'}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Increment the counter
                ref.read(counterProvider.notifier).state++;
              },
              child: Text('Increment Counter'),
            ),
            ElevatedButton(
              onPressed: () {
                // Set a name (for demonstration, we just toggle a name)
                ref.read(setNameProvider.notifier).state =
                (name == null) ? 'Your Name' : null;
              },
              child: Text('Toggle Name'),
            ),
          ],
        ),
      ),
    );
  }
}
