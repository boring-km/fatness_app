class BMI {

  final double _height, _weight;
  double _bmi;
  double get bmi => _bmi;

  String imageURL, status;
  BMIType type;

  BMI(this._height, this._weight) {
    _bmi = _weight / (_height * _height);
    type = _getType(_bmi);
    imageURL = type.imageURL;
    status = type.status;
  }

  BMIType _getType(double bmi) {
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

  String get status {
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