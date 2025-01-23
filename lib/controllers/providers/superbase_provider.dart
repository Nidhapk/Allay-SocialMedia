import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProvider extends InheritedWidget {
  final SupabaseClient supabaseClient;

  const SupabaseProvider({
    required this.supabaseClient,
    required Widget child,
  }) : super(child: child);

  static SupabaseClient of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<SupabaseProvider>();
    return provider!.supabaseClient;
  }

  @override
  bool updateShouldNotify(SupabaseProvider oldWidget) {
    return oldWidget.supabaseClient != supabaseClient;
  }
}