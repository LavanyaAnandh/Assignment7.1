A = load '/home/acadgild/employee_details.txt' using PigStorage(',');
B = foreach A generate (int)$0 as EmpId, (chararray)$1 as Name, (int)$2 as salary ,(int)$3 as rating;
A1 = load '/home/acadgild/employee_expenses.txt' using PigStorage('\t');
B1 = foreach A1 generate (int)$0 as EmpId, (int)$1 as Expense;
C1 = group B1 by EmpId;
D1 = foreach C1 generate group as EmpId;
Joined_table = Join B by $0 full, D1 by EmpId;
C = FILTER Joined_table by $4 is null ;
final = foreach C generate $0, $1;
dump final;

