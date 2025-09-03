import 'package:ds_ver2/app/common/packages.dart';
import 'package:ds_ver2/features/dashboard/private_presentation.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Container(),
    );
  }
}
