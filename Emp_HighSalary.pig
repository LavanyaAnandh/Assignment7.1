A = load  '/home/acadgild/employee_details.txt' using PigStorage(',');
B = foreach A generate (int)$0 as EmpId, (chararray)$1 as EmpName, (int)$2 as salary;
C = order B by $2  DESC;
D = filter C by ($0%2 !=0);
E = LIMIT D 3;
dump E;

