class DashboardFlagDomain {
  final bool? welcome;
  final bool? joinCommunity;
  final bool? createCommunity;
  final bool? quickActions;

  DashboardFlagDomain(
      {this.welcome = true,
      this.joinCommunity = true,
      this.createCommunity = true,
      this.quickActions = false});
}
