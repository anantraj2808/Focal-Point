class Job{
  String jobId;
  String companyName;
  String salary;
  String payBasis;
  String city;
  String state;
  String professionType;
  String dutyType;
  String numberOfOpenings;
  String minimumQualification;
  String languageRequired;
  String description;
  String experienceRequired;
  String workTimings;
  String completeAddress;
  String adminPhone;

  Job({this.jobId,this.companyName,this.salary,this.payBasis,this.city,this.state,this.professionType,this.dutyType,
        this.numberOfOpenings,this.minimumQualification,this.languageRequired,this.description,
        this.experienceRequired,this.workTimings,this.completeAddress,this.adminPhone});

  factory Job.fromJson(Map<String,dynamic> json){
    return Job(
      jobId: json['_id'],
      companyName: json['companyName'],
      salary: json['salary'],
      payBasis: json['payBasis'],
      city: json['city'],
      state: json['state'],
      professionType: json['professionType'],
      dutyType: json['type'],
      numberOfOpenings: json['openings'],
      minimumQualification: json['minQualification'],
      languageRequired: json['language'],
      description: json['jobDescription'],
      experienceRequired: json['minExperience'],
      workTimings: json['timing'],
      completeAddress: json['address'],
      adminPhone: json['adminPhone']
    );
  }
}