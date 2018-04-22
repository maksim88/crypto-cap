class Currency {
  final String id;
  final String rank;
  final String name;
  final String symbol;
  final String priceUsd;

  final String change1h;
  final String change24h;
  final String change7d;

  final String volume24h;
  final String marketCapUsd;
  final String availableSupply;
  final String totalSupply;

  Currency(
      {this.id,
      this.rank,
      this.name,
      this.symbol,
      this.priceUsd,
      this.change1h,
      this.change24h,
      this.change7d,
      this.volume24h,
      this.marketCapUsd,
      this.availableSupply,
      this.totalSupply});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return new Currency(
      id: json['id'],
      rank: json['rank'],
      name: json['name'],
      symbol: json['symbol'],
      priceUsd: json['price_usd'],
      change1h: json['percent_change_1h'],
      change24h: json['percent_change_24h'],
      change7d: json['percent_change_7d'],
      volume24h: json['24h_volume_usd'],
      marketCapUsd: json['market_cap_usd'],
      availableSupply: json['available_supply'],
      totalSupply: json['total_supply'],
    );
  }
}
