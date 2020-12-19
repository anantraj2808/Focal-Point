class Job{
  String companyName;
  String salary;
  String payBasis;
  String city;
  String state;
  String professionType;
  String dutyType;
  int numberOfOpenings;
  String minimumQualification;
  String languageRequired;
  String description;
  String experienceRequired;
  String workTimings;
  String completeAddress;

  Job({this.companyName,this.salary,this.payBasis,this.city,this.state,this.professionType,this.dutyType,
        this.numberOfOpenings,this.minimumQualification,this.languageRequired,this.description,
        this.experienceRequired,this.workTimings,this.completeAddress});

  factory Job.fromJson(Map<String,dynamic> json){
    return Job(
      companyName: json['companyName'],
      salary: json['salary'],
      payBasis: json['payBasis'],
      city: json['city'],
      state: json['state'],
      professionType: json['professionType'],
      dutyType: json['dutyType'],
      numberOfOpenings: json['numberOfOpenings'],
      minimumQualification: json['minimumQualification'],
      languageRequired: json['languageRequired'],
      description: json['description'],
      experienceRequired: json['experienceRequired'],
      workTimings: json['workTimings'],
      completeAddress: json['completeAddress'],
    );
  }
}