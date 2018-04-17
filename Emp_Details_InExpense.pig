A = load '/home/acadgild/employee_details.txt' using PigStorage(',');
B = foreach A generate (int)$0 as EmpId, (chararray)$1 as Name;
A1 = load '/home/acadgild/employee_expenses.txt' using PigStorage('\t');
B1 = foreach A1 generate (int)$0 as EmpId;
C1 = group B1 by EmpId;
D1 = foreach C1 generate group as EmpId;
joined_table = join B by $0 full, D1 by EmpId;
C = FILTER joined_table by $2 is not null ;
final = foreach C generate $2, $1;
dump final;

