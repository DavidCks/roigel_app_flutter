import 'package:supabase_flutter/supabase_flutter.dart';

Future<SupabaseAuth> init_supabase_auth() async {
  await Supabase.initialize(
      url: 'http://localhost:8000',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE');
  return await SupabaseAuth.initialize();
}
