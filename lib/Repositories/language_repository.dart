import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/dio_service.dart';
import 'package:chatface/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageRepository {
  LanguageRepository(this.ref);
  final Ref ref;

  DioService get _dioService => ref.read(AllProviders.dioServiceProvider);

  /// Get all available languages
  /// GET /api/languages
  Future<List<LanguageModel>> getAvailableLanguages({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dioService.get(
        'languages',
        cancelToken: cancelToken,
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;
        final List languages = data['languages'] as List;
        return languages
            .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      Print.error('Error fetching languages: $e');
      rethrow;
    }
  }
}

class LanguageModel {
  final String code;
  final String name;

  LanguageModel({required this.code, required this.name});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'code': code, 'name': name};
}
