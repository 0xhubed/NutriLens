import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/ai_provider.dart';
import '../../data/services/ai_provider_manager.dart';
import '../../data/providers/analysis_providers.dart';

class ProviderSettingsScreen extends ConsumerStatefulWidget {
  const ProviderSettingsScreen({super.key});

  @override
  ConsumerState<ProviderSettingsScreen> createState() => _ProviderSettingsScreenState();
}

class _ProviderSettingsScreenState extends ConsumerState<ProviderSettingsScreen> {
  Map<String, bool> _providerStatus = {};
  Map<String, double> _providerCosts = {};
  
  @override
  void initState() {
    super.initState();
    _loadProviderData();
  }

  Future<void> _loadProviderData() async {
    final providerManager = ref.read(aiProviderManagerProvider);
    await providerManager.initialize();
    final status = await providerManager.getProviderStatus();
    final costs = providerManager.estimateAllProviderCosts();
    
    if (mounted) {
      setState(() {
        _providerStatus = status;
        _providerCosts = costs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Provider Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadProviderData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildCurrentProviderCard(),
            const SizedBox(height: 16),
            _buildProviderList(),
            const SizedBox(height: 16),
            _buildCostComparison(),
            const SizedBox(height: 16),
            _buildAdvancedSettings(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentProviderCard() {
    final providerManager = ref.read(aiProviderManagerProvider);
    final activeProvider = providerManager.activeProvider;
    final fallbackProvider = providerManager.fallbackProvider;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Configuration',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text('Primary: ${activeProvider?.name ?? 'None'}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.backup,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text('Fallback: ${fallbackProvider?.name ?? 'None'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Providers',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ...ref.read(aiProviderManagerProvider).providers.map((provider) => _buildProviderTile(provider)),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderTile(AIProvider provider) {
    final providerManager = ref.read(aiProviderManagerProvider);
    final isActive = providerManager.activeProvider?.providerId == provider.providerId;
    final isConfigured = _providerStatus[provider.providerId] ?? false;
    final cost = _providerCosts[provider.providerId] ?? 0.0;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isConfigured ? Colors.green : Colors.grey,
        child: Icon(
          isConfigured ? Icons.check : Icons.close,
          color: Colors.white,
        ),
      ),
      title: Text(provider.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isConfigured ? 'Configured' : 'Not configured'),
          Text('Est. cost: \$${cost.toStringAsFixed(3)} per image'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isActive)
            Chip(
              label: const Text('Active'),
              backgroundColor: Colors.green.shade100,
            ),
          PopupMenuButton<String>(
            onSelected: (action) => _handleProviderAction(provider, action),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'configure',
                child: Text('Configure'),
              ),
              const PopupMenuItem(
                value: 'set_active',
                child: Text('Set as Primary'),
              ),
              const PopupMenuItem(
                value: 'set_fallback',
                child: Text('Set as Fallback'),
              ),
              const PopupMenuItem(
                value: 'test',
                child: Text('Test'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCostComparison() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cost Comparison',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              'Estimated costs per image analysis:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            ..._providerCosts.entries.map((entry) {
              final provider = ref.read(aiProviderManagerProvider).getProviderById(entry.key);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(provider?.name ?? entry.key),
                    Text('\$${entry.value.toStringAsFixed(3)}'),
                  ],
                ),
              );
            }),
            const SizedBox(height: 8),
            Text(
              '*Estimates may vary based on actual usage',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedSettings() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Advanced Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.compare),
              title: const Text('Compare Providers'),
              subtitle: const Text('Test the same image with all providers'),
              onTap: () => _showProviderComparison(context),
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Refresh Status'),
              subtitle: const Text('Check configuration status'),
              onTap: _loadProviderData,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleProviderAction(AIProvider provider, String action) async {
    final providerManager = ref.read(aiProviderManagerProvider);
    
    switch (action) {
      case 'configure':
        await _showConfigureDialog(provider);
        break;
      case 'set_active':
        await providerManager.setActiveProvider(provider.providerId);
        await _loadProviderData();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${provider.name} set as primary provider')),
          );
        }
        break;
      case 'set_fallback':
        await providerManager.setFallbackProvider(provider.providerId);
        await _loadProviderData();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${provider.name} set as fallback provider')),
          );
        }
        break;
      case 'test':
        await _testProvider(provider);
        break;
    }
  }

  Future<void> _showConfigureDialog(AIProvider provider) async {
    final controllers = <String, TextEditingController>{};
    
    for (final entry in provider.requiredConfigKeys.entries) {
      controllers[entry.key] = TextEditingController();
    }

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Configure ${provider.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: provider.requiredConfigKeys.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                controller: controllers[entry.key],
                decoration: InputDecoration(
                  labelText: entry.value,
                  border: const OutlineInputBorder(),
                ),
                obscureText: entry.key.contains('key'),
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final config = <String, String>{};
              for (final entry in controllers.entries) {
                config[entry.key] = entry.value.text;
              }
              
              try {
                await provider.configure(config);
                await _loadProviderData();
                if (mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${provider.name} configured successfully')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Configuration failed: $e')),
                  );
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _testProvider(AIProvider provider) async {
    // This would require a test image - for now, just show a placeholder dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Test ${provider.name}'),
        content: const Text('Provider testing requires a test image. This feature will be implemented when image selection is added.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showProviderComparison(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Provider Comparison'),
        content: const Text('Provider comparison requires a test image. This feature will be implemented when image selection is added.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI Provider Help'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Primary Provider',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('The main AI service used for food analysis.'),
              SizedBox(height: 8),
              Text(
                'Fallback Provider',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Used automatically if the primary provider fails.'),
              SizedBox(height: 8),
              Text(
                'Configuration',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Each provider requires an API key. Get yours from:'),
              Text('• OpenAI: platform.openai.com'),
              Text('• Anthropic: console.anthropic.com'),
              Text('• Google: ai.google.dev'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}