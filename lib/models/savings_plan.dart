enum SavingsType { Thrift, Flex, FlexExtra, CustomTarget }

class SavingsPlan {
  final String id;
  final SavingsType type;
  final double balance;
  final String? goal;

  SavingsPlan({required this.id, required this.type, required this.balance, this.goal});

  String get label {
    switch (type) {
      case SavingsType.Thrift:
        return 'Thrift (Fixed)';
      case SavingsType.Flex:
        return 'Flex (Flexible)';
      case SavingsType.FlexExtra:
        return 'Flex Extra (SME)';
      case SavingsType.CustomTarget:
        return 'Custom Target';
    }
  }
}
