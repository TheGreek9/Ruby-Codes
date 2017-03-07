print ("Enter Salary: ")
salary = Integer(gets.chomp())
print("Enter Season: ")
season = gets.chomp()

happy = case
when salary > 10000 && season == 'summer'then
		puts( "Yes, I really am happy!" )
		'Very happy'
	when salary > 500000 && season == 'spring' then 'Pretty happy'
	else puts( 'miserable' )
end


puts( happy )
