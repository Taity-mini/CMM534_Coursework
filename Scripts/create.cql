//Neo4j Creation Script

// Create Courses

CREATE (C001:Courses {course_id:'C001', title:'Computing Science'})
CREATE (C002:Courses {course_id:'C002', title:'Data Science'})


//Create Modules

CREATE (M001:Modules {module_id:'M001',  code:'CMM504', title:'OOP'})
CREATE (M002:Modules {module_id:'M002',  code:'CMM507', title:'Professional Development'})
CREATE (M003:Modules {module_id:'M003',  code:'CMM510', title:'Data Mining'})
CREATE (M004:Modules {module_id:'M004',  code:'CMM524', title:'Data Management'})
CREATE (M005:Modules {module_id:'M005',  code:'CMM530', title:'Systems Administration'})
CREATE (M006:Modules {module_id:'M006',  code:'CMM531', title:'Data Warehousing'})
CREATE (M007:Modules {module_id:'M007',  code:'CMM534', title:'Big Data'})
CREATE (M008:Modules {module_id:'M008',  code:'CMM535', title:'Data Visualistion'})
CREATE (M009:Modules {module_id:'M009',  code:'CMM539', title:'Information Retrieval'})

//Create Staff

CREATE (S001:Staff {staff_id:'S001', name: 'David Lonie'})
CREATE (S002:Staff {staff_id:'S002', name: 'Ines Arana'})
CREATE (S003:Staff {staff_id:'S003', name: 'Rob Lothian'})
CREATE (S004:Staff {staff_id:'S004', name: 'Eyad Elyan'})

//Create Cohorts
CREATE(CH001:Cohorts {cohort_id: 'CH001', name:'CS01', start_date: 'September 2017', num_of_students: 15})
CREATE(CH002:Cohorts {cohort_id: 'CH002', name:'DS01', start_date: 'September 2017', num_of_students: 25})
CREATE(CH003:Cohorts {cohort_id: 'CH003', name:'CS02', start_date: 'January 2018',   num_of_students: 23})
CREATE(CH004:Cohorts {cohort_id: 'CH004', name:'DS02', start_date: 'January 2018',   num_of_students: 10})

//Create Semesters

//CREATE(SM001:Semesters {semester_id: 'SM001', name: 'Semester 1 2017/2018'})
//CREATE(SM002:Semesters {semester_id: 'SM002', name: 'Semester 2 2017/2018'})



//Create Relationships


//Add cohorts to courses

CREATE
	(CH001)-[:belongs_to]->(C001),
	(CH002)-[:belongs_to]->(C002),
	(CH003)-[:belongs_to]->(C001),
	(CH004)-[:belongs_to]->(C002)
	  
	  
//Link cohorts together
CREATE
	(CH001)-[:is_before]->(CH003),
	(CH002)-[:is_before]->(CH004)

//Add modules to cohourts

CREATE
	   //Computing Science Semester 1 Modules
	  (M004)-[:taught_in{semester:'SM001'}]->(CH001),
	  (M005)-[:taught_in{semester:'SM001'}]->(CH001),
	  (M009)-[:taught_in{semester:'SM001'}]->(CH001),

	  //Computing Science Semester 2 Modules
	  (M002)-[:taught_in{semester:'SM002'}]->(CH003),
	  (M003)-[:taught_in{semester:'SM002'}]->(CH003),
	  (M007)-[:taught_in{semester:'SM002'}]->(CH003),
		
      //Data Science Semester 1 Modules
      (M002)-[:taught_in{semester:'SM001'}]->(CH002),
      (M003)-[:taught_in{semester:'SM001'}]->(CH002),
	  (M006)-[:taught_in{semester:'SM001'}]->(CH002),
	
	  //Data Science Semester 2 Modules

      (M002)-[:taught_in{semester:'SM002'}]->(CH004),
	  (M007)-[:taught_in{semester:'SM002'}]->(CH004),
	  (M008)-[:taught_in{semester:'SM002'}]->(CH004)	
 		  

//Add staff to modules

CREATE
	  //David Lonie

	  (S001)-[:is_leader]->(M001),
	  (S001)-[:is_leader]->(M002),
	  (S001)-[:is_other_staff]->(M003),

	  
	  //Ines Arana

	  (S002)-[:is_leader]->(M003),
	  (S002)-[:is_leader]->(M005),
	  
	  //Rob Lothian

	  (S003)-[:is_leader]->(M004),
	  (S003)-[:is_leader]->(M007),
	  (S003)-[:is_leader]->(M008),
	  (S003)-[:is_other_staff]->(M006),

	  //Eyad Elyan

	  (S004)-[:is_leader]->(M006),
	  (S004)-[:is_leader]->(M009),
	  (S004)-[:is_other_staff]->(M007)




	  