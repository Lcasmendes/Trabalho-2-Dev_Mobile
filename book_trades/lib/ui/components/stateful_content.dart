import 'package:flutter/material.dart';

class StatefulContent extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final bool isEmpty;
  final String emptyMessage;
  final String Function(String) errorMessageBuilder;
  final String Function(String) searchEmptyMessageBuilder;
  final Widget child;
  final String? searchQuery;

  const StatefulContent({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.isEmpty,
    required this.emptyMessage,
    required this.errorMessageBuilder,
    required this.searchEmptyMessageBuilder,
    required this.child,
    this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessageBuilder(errorMessage!),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (isEmpty) {
      if (searchQuery != null && searchQuery!.isNotEmpty) {
        return Center(
          child: Text(
            searchEmptyMessageBuilder(searchQuery!),
            textAlign: TextAlign.center,
          ),
        );
      }
      return Center(
        child: Text(
          emptyMessage,
          textAlign: TextAlign.center,
        ),
      );
    }

    return child;
  }
}