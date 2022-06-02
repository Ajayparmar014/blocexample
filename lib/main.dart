import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc/cubit/internet_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Bloc example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bloc Example'),
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Internet connected!',
                ),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Internet not connected',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text('Connected!');
              } else if (state == InternetState.Lost) {
                return const Text('Not connected');
              } else {
                return const Text('Loading....');
              }
            },
          );
        },
      ),
    );
  }
}
