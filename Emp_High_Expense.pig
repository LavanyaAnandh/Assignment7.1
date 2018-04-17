A = load '/home/acadgild/employee_details.txt' using PigStorage(',');
B = foreach A generate (int)$0 as EmpId, (chararray)$1 as Name;
A1 = load '/home/acadgild/employee_expenses.txt' using PigStorage('\t');
B1 = foreach A1 generate (int)$0 as EmpId, (int)$1 as expense;
C1 = group B1 by EmpId;
D1 = foreach C1 generate group as EmpId, SUM(B1.expense) as tot_expense;
joined_table = join B by $0, D1 by EmpId; 
final = foreach joined_table generate $0, $1, $3;
final_order = order final by $2 DESC, $1 ASC;
dump final_order;

