class BMI {

  static BMIType calculate(double height, double weight) {
    double bmi = weight / (height * height);
    if (bmi <= 18.5) {
      return BMIType.LOW_WEIGHT;
    } else if (bmi <= 22.9) {
      return BMIType.NORMAL;
    } else if (bmi <= 24.9) {
      return BMIType.OVER_WEIGHT;
    } else {
      return BMIType.FAT;
    }
  }
}

enum BMIType {
  LOW_WEIGHT,
  NORMAL,
  OVER_WEIGHT,
  FAT
}

extension BMITypeExtension on BMIType{
  String get imageURL {
    switch (this) {
      case BMIType.LOW_WEIGHT:
        return 'assets/warning.png';
      case BMIType.NORMAL:
        return 'assets/normal.png';
      case BMIType.OVER_WEIGHT:
        return 'assets/warning.png';
      default:
        return 'assets/fat.png';
    }
  }

  String get text {
    switch (this) {
      case BMIType.LOW_WEIGHT:
        return '저체중';
      case BMIType.NORMAL:
        return '정상';
      case BMIType.OVER_WEIGHT:
        return '과체중';
      default:
        return '비만';
    }
  }
}