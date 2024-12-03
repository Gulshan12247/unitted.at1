import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/provider/provider.dart';
import 'package:http/testing.dart';

class testing extends ConsumerStatefulWidget {
  const testing({super.key});

  @override
  ConsumerState<testing> createState() => _testingState();
}

class _testingState extends ConsumerState<testing> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var counter = ref.watch(counterProvider);
        var textName = ref.watch(setNameProvider);

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(textName ?? ""),

              Text(counter.toString()),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  child: Text("Increment"),
                  onPressed: () {
                    ref.read(setNameProvider.notifier).state = "hello";

                    ref.read(counterProvider.notifier).state = counter++;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  child: Text("Decrement"),
                  onPressed: () {
                    ref.read(setNameProvider.notifier).state = "bye-bye";

                    ref.read(counterProvider.notifier).state = counter--;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
