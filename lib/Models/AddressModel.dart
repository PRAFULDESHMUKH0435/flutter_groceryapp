class AddressModel{
  String FirstName;
  String LastName;
  String MobileNumber;
  String AlterNateMobileNumber;
  String Society;
  String Street;
  String Landmark;
  String City;
  String Area;
  String PinCode;
  String ID;
  String deliveryaddresstype;
  bool isselected;
  AddressModel(
      {required this.FirstName,
        required this.LastName,
        required this.MobileNumber,
        required this.AlterNateMobileNumber,
        required this.Society,
        required this.Street,
        required this.Landmark,
        required this.City,
        required this.Area,
        required this.ID,
        required this.deliveryaddresstype,
        required this.isselected,
        required this.PinCode,}
      );
}