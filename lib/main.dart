// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'feature/presentation/quize_page/controller/questions_cubit.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';
import 'route_generator.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final box = await Hive.openBox<dynamic>('results');
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<QuestionsCubit>(
          create: (context) => sl<QuestionsCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
