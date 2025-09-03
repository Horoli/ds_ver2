import 'package:ds_ver2/features/login/private_domain.dart';
import 'package:ds_ver2/app/common/packages.dart';
import 'package:ds_ver2/features/login/presentation/controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final id = TextEditingController();
  final pw = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    id.dispose();
    pw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    ref.listen<AuthState>(authControllerProvider, (prev, next) {
      if (next is AuthAuthed) {
        if (mounted) context.go('/dashboard');
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: id,
                decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 8),
            TextField(
                controller: pw,
                decoration: const InputDecoration(labelText: 'Employee ID')),
            const SizedBox(height: 16),
            switch (state) {
              AuthLoading() => const Center(child: CircularProgressIndicator()),
              AuthError(:final message) =>
                Text(message, style: const TextStyle(color: Colors.red)),
              _ => ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(authControllerProvider.notifier)
                        .login(id: id.text, pw: pw.text);
                  },
                  child: const Text('Login'),
                ),
            },
          ],
        ),
      ),
    );
  }
}
