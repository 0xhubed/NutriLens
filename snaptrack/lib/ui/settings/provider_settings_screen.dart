import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../data/services/ai_provider.dart';
import '../../data/services/ai_provider_manager.dart';
import '../../data/providers/analysis_providers.dart';

class ProviderSettingsScreen extends ConsumerStatefulWidget {
  const ProviderSettingsScreen({super.key});

  @override
  ConsumerState<ProviderSettingsScreen> createState() => _ProviderSettingsScreenState();
}

class _ProviderSettingsScreenState extends ConsumerState<ProviderSettingsScreen> 
    with TickerProviderStateMixin {
  Map<String, bool> _providerStatus = {};
  Map<String, double> _providerCosts = {};
  
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _loadProviderData();
    _fadeController.forward();
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
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
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          _buildModernAppBar(context, colorScheme),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      _buildStatusOverview(colorScheme),
                      const SizedBox(height: AppSpacing.lg),
                      _buildProvidersList(colorScheme),
                      const SizedBox(height: AppSpacing.lg),
                      _buildCostAnalysis(colorScheme),
                      const SizedBox(height: AppSpacing.lg),
                      _buildAdvancedOptions(colorScheme),
                      const SizedBox(height: AppSpacing.xxxl),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildModernAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 56,
          bottom: AppSpacing.md,
        ),
        title: Text(
          'AI Providers',
          style: AppTextStyles.headlineLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary.withOpacity(0.05),
                colorScheme.secondary.withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.of(context).pop(),
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceVariant.withOpacity(0.8),
          foregroundColor: colorScheme.onSurfaceVariant,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline_rounded),
          onPressed: () => _showHelpDialog(context),
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.surfaceVariant.withOpacity(0.8),
            foregroundColor: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
      ],
    );
  }
  
  Widget _buildStatusOverview(ColorScheme colorScheme) {
    final providerManager = ref.read(aiProviderManagerProvider);
    final activeProvider = providerManager.activeProvider;
    final fallbackProvider = providerManager.fallbackProvider;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer.withOpacity(0.3),
            colorScheme.secondaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.15),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.settings_rounded,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Configuration',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Your AI provider setup',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: _buildStatusCard(
                  'Primary Provider',
                  activeProvider?.name ?? 'Not Set',
                  activeProvider != null,
                  Icons.flash_on_rounded,
                  colorScheme.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildStatusCard(
                  'Fallback Provider',
                  fallbackProvider?.name ?? 'Not Set',
                  fallbackProvider != null,
                  Icons.backup_rounded,
                  colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatusCard(String title, String value, bool isConfigured, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppRadius.large,
        border: Border.all(
          color: isConfigured ? color.withOpacity(0.3) : Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isConfigured ? color : Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: (isConfigured ? color : Theme.of(context).colorScheme.outline).withOpacity(0.1),
                  borderRadius: AppRadius.extraLarge,
                ),
                child: Text(
                  isConfigured ? 'Active' : 'Inactive',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isConfigured ? color : Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: AppTextStyles.labelMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTextStyles.labelLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProvidersList(ColorScheme colorScheme) {
    final providerManager = ref.read(aiProviderManagerProvider);
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.tertiary.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.hub_rounded,
                  color: colorScheme.tertiary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Available Providers',
                style: AppTextStyles.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ...providerManager.providers.map((provider) => _buildModernProviderTile(provider, colorScheme)),
        ],
      ),
    );
  }
  
  Widget _buildModernProviderTile(AIProvider provider, ColorScheme colorScheme) {
    final providerManager = ref.read(aiProviderManagerProvider);
    final isActive = providerManager.activeProvider?.providerId == provider.providerId;
    final isFallback = providerManager.fallbackProvider?.providerId == provider.providerId;
    final isConfigured = _providerStatus[provider.providerId] ?? false;
    final cost = _providerCosts[provider.providerId] ?? 0.0;
    
    Color getProviderColor() {
      switch (provider.providerId) {
        case 'openai':
          return const Color(0xFF10A37F);
        case 'anthropic':
          return const Color(0xFFE97627);
        case 'google':
          return const Color(0xFF4285F4);
        default:
          return colorScheme.primary;
      }
    }
    
    IconData getProviderIcon() {
      switch (provider.providerId) {
        case 'openai':
          return Icons.auto_awesome_rounded;
        case 'anthropic':
          return Icons.psychology_rounded;
        case 'google':
          return Icons.search_rounded;
        default:
          return Icons.smart_toy_rounded;
      }
    }
    
    final providerColor = getProviderColor();
    final providerIcon = getProviderIcon();
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: isActive ? providerColor.withOpacity(0.05) : colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: AppRadius.large,
        border: Border.all(
          color: isActive ? providerColor.withOpacity(0.3) : colorScheme.outline.withOpacity(0.2),
          width: isActive ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () => _showProviderActions(provider, colorScheme),
        borderRadius: AppRadius.large,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: providerColor.withOpacity(0.1),
                      borderRadius: AppRadius.medium,
                    ),
                    child: Icon(
                      providerIcon,
                      color: providerColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              provider.name,
                              style: AppTextStyles.titleLarge.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            if (isActive) _buildStatusChip('Primary', providerColor),
                            if (isFallback && !isActive) _buildStatusChip('Fallback', colorScheme.secondary),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Icon(
                              isConfigured ? Icons.check_circle_rounded : Icons.error_outline_rounded,
                              color: isConfigured ? AppColors.success : AppColors.warning,
                              size: 16,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              isConfigured ? 'Configured' : 'Needs Setup',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: isConfigured ? AppColors.success : AppColors.warning,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${cost.toStringAsFixed(4)}/image',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
      ),
    );
  }
  
  Widget _buildCostAnalysis(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.fatsYellow.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.analytics_rounded,
                  color: AppColors.fatsYellow,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Cost Analysis',
                style: AppTextStyles.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: AppRadius.medium,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Provider',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Cost/Image',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                const Divider(height: 1),
                const SizedBox(height: AppSpacing.sm),
                ..._providerCosts.entries.map((entry) => _buildCostRow(entry.key, entry.value, colorScheme)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.05),
              borderRadius: AppRadius.medium,
              border: Border.all(
                color: AppColors.info.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.info,
                  size: 16,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Estimated costs based on provider pricing. Actual costs may vary.',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.info,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCostRow(String providerId, double cost, ColorScheme colorScheme) {
    final providerName = _getProviderName(providerId);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              providerName,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\$${cost.toStringAsFixed(4)}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAdvancedOptions(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.extraLarge,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  Icons.tune_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Advanced Options',
                style: AppTextStyles.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildAdvancedOption(
            'Compare Providers',
            'View detailed comparison',
            Icons.compare_rounded,
            colorScheme.tertiary,
            () => _showProviderComparison(),
          ),
          _buildAdvancedOption(
            'Refresh Status',
            'Update provider status',
            Icons.refresh_rounded,
            colorScheme.secondary,
            _loadProviderData,
          ),
        ],
      ),
    );
  }
  
  Widget _buildAdvancedOption(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.medium,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: AppRadius.medium,
            border: Border.all(
              color: color.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 24,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color.withOpacity(0.6),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showProviderActions(AIProvider provider, ColorScheme colorScheme) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outline.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              provider.name,
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildActionOption(
              'Configure',
              'Set up API key and settings',
              Icons.settings_rounded,
              colorScheme.primary,
              () {
                Navigator.pop(context);
                _handleProviderAction('configure', provider);
              },
            ),
            _buildActionOption(
              'Set as Primary',
              'Use as main provider',
              Icons.flash_on_rounded,
              AppColors.success,
              () {
                Navigator.pop(context);
                _handleProviderAction('setActive', provider);
              },
            ),
            _buildActionOption(
              'Set as Fallback',
              'Use as backup provider',
              Icons.backup_rounded,
              colorScheme.secondary,
              () {
                Navigator.pop(context);
                _handleProviderAction('setFallback', provider);
              },
            ),
            _buildActionOption(
              'Test Provider',
              'Check if working correctly',
              Icons.check_circle_rounded,
              colorScheme.tertiary,
              () {
                Navigator.pop(context);
                _handleProviderAction('test', provider);
              },
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
  
  Widget _buildActionOption(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.large,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: AppRadius.large,
            border: Border.all(
              color: color.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color.withOpacity(0.6),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> _handleProviderAction(String action, AIProvider provider) async {
    final providerManager = ref.read(aiProviderManagerProvider);
    final colorScheme = Theme.of(context).colorScheme;
    
    try {
      switch (action) {
        case 'configure':
          await _showConfigureDialog(provider);
          break;
        case 'setActive':
          await providerManager.setActiveProvider(provider.providerId);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text('${provider.name} set as primary provider'),
                  ],
                ),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.medium,
                ),
                margin: const EdgeInsets.all(AppSpacing.md),
              ),
            );
          }
          break;
        case 'setFallback':
          await providerManager.setFallbackProvider(provider.providerId);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.backup_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text('${provider.name} set as fallback provider'),
                  ],
                ),
                backgroundColor: colorScheme.secondary,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.medium,
                ),
                margin: const EdgeInsets.all(AppSpacing.md),
              ),
            );
          }
          break;
        case 'test':
          _testProvider(provider);
          break;
      }
      await _loadProviderData();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text('Error: $e'),
              ],
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.medium,
            ),
            margin: const EdgeInsets.all(AppSpacing.md),
          ),
        );
      }
    }
  }
  
  Future<void> _showConfigureDialog(AIProvider provider) async {
    final controllers = <String, TextEditingController>{};
    final configKeys = provider.requiredConfigKeys.keys.toList();
    
    for (String key in configKeys) {
      controllers[key] = TextEditingController();
    }
    
    final colorScheme = Theme.of(context).colorScheme;
    
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.settings_rounded,
              color: colorScheme.primary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text('Configure ${provider.name}'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: configKeys.map((key) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: TextFormField(
                controller: controllers[key],
                obscureText: key.toLowerCase().contains('key'),
                decoration: InputDecoration(
                  labelText: _formatConfigKeyName(key),
                  border: OutlineInputBorder(
                    borderRadius: AppRadius.medium,
                  ),
                  prefixIcon: Icon(
                    key.toLowerCase().contains('key') ? Icons.key_rounded : Icons.settings_rounded,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            )).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              for (var controller in controllers.values) {
                controller.dispose();
              }
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final config = <String, String>{};
              for (var entry in controllers.entries) {
                config[entry.key] = entry.value.text;
              }
              
              try {
                await provider.configure(config);
                
                for (var controller in controllers.values) {
                  controller.dispose();
                }
                Navigator.pop(context);
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text('${provider.name} configured successfully'),
                        ],
                      ),
                      backgroundColor: AppColors.success,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.medium,
                      ),
                      margin: const EdgeInsets.all(AppSpacing.md),
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(
                            Icons.error_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text('Configuration failed: $e'),
                        ],
                      ),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.medium,
                      ),
                      margin: const EdgeInsets.all(AppSpacing.md),
                    ),
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
  
  void _testProvider(AIProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text('Test ${provider.name}'),
          ],
        ),
        content: Text(
          'Provider testing requires a food image. Go to the camera screen to test with a real image.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
  
  void _showProviderComparison() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.compare_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('Provider Comparison'),
          ],
        ),
        content: Text(
          'Detailed provider comparison coming soon! For now, check the cost analysis section.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.extraLarge,
        ),
        title: Row(
          children: [
            Icon(
              Icons.help_outline_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('Provider Help'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How AI Providers Work',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '• Primary Provider: Your main AI service for food analysis\\n'
                '• Fallback Provider: Backup service if primary fails\\n'
                '• All providers need API keys to function',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Getting API Keys',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '• OpenAI: platform.openai.com/api-keys\\n'
                '• Anthropic: console.anthropic.com\\n'
                '• Google: aistudio.google.com/app/apikey',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
  
  String _formatConfigKeyName(String key) {
    return key.split('_')
        .map((word) => word.substring(0, 1).toUpperCase() + word.substring(1))
        .join(' ');
  }
  
  String _getProviderName(String providerId) {
    switch (providerId) {
      case 'openai':
        return 'OpenAI';
      case 'anthropic':
        return 'Anthropic';
      case 'google':
        return 'Google';
      default:
        return providerId;
    }
  }
}