class Famille{
  final String famId;
  final String name;
  final String dette;

  Famille(this.famId, this.name, this.dette);

  Map<String, dynamic> toEmployee() => {
    'name':name,
    'dette':dette,
  };
}