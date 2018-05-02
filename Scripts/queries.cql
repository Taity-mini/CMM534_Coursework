//Neo4J Queries Script

//Query 1
match(m:Modules{code:'CMM534'})-[:taught_in{semester:"SM002"}]-(c:Cohorts)-[:is_before]-(c2:Cohorts) return sum(c.num_of_students) + sum(c2.num_of_students)


//Query 2

match(s:Staff)-[]-(m:Modules)-[:taught_in{semester:"SM002"}]-(c:Cohorts{name:"DS02"}) 
return s.name as Name, collect (m.title) as ModulesTaught