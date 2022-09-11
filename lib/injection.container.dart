import 'package:get_it/get_it.dart';
import 'package:quiz_app/feature/data/datasource/quize.dart';
import 'package:quiz_app/feature/data/datasource/quize_implement.dart';
import 'package:quiz_app/feature/data/repository/questions_implements.dart';
import 'package:quiz_app/feature/domain/repositories/questions.dart';
import 'package:quiz_app/feature/domain/usecases/get_questions.dart';
import 'package:quiz_app/feature/presentation/question_and_difficulty_page/controller/question_and_difficulty_state.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(() => QuestionAndDifficultyCubit(getQuestions: sl()));
  //Usecases
  sl.registerLazySingleton(() => GetQuestions(sl()));
  //Repository
  sl.registerLazySingleton<QuestionsRepository>(
      () => QuestionsRepositoryImplements(sl()));
  //Datasource
  sl.registerLazySingleton<QuizeDataSource>(() => QuizeImplement());
}
