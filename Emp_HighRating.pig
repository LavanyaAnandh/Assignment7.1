A = load  '/home/acadgild/employee_details.txt' using PigStorage(','); 
B = foreach A generate (int)$0 as EmpId, (chararray)$1 as EmpName, (int)$3 as rating;
C = order B by $2  DESC, $1 ASC; 
D = LIMIT C 5;
dump D;

