class Job{
  String companyName;
  String salary;
  String city;
  String state;
  String professionType;
  String dutyType;

  Job({this.companyName,this.salary,this.city,this.state,this.professionType,this.dutyType});

  factory Job.fromJson(Map<String,dynamic> json){
    return Job(
      companyName: json['companyName'],
      salary: json['salary'],
      city: json['city'],
      state: json['state'],
      professionType: json['professionType'],
      dutyType: json['dutyType'],
    );
  }
}