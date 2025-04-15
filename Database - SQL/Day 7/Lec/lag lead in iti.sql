
SELECT dept_id,st_age,
	   stud_prev=lAG(st_age) OVER(ORDER BY st_age),
	   stud_Next=LEAD(st_age) OVER(ORDER BY st_age )
FROM student

SELECT st_fname,dept_id,st_age,
       stud_prev=lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),
	   stud_Next=LEAD(st_age) OVER(PARTITION BY dept_id ORDER BY st_age )
FROM student

SELECT st_fname,dept_id,st_age,
	   lowest=FIRST_VALUE(st_age) OVER(PARTITION BY dept_id ORDER BY st_age ),
	   Highest=LAST_VALUE(st_age) OVER(PARTITION BY dept_id ORDER BY st_age ROWS BETWEEN unbounded preceding AND unbounded following),
	   stud_prev=lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),
	   stud_Next=LEAD(st_age) OVER(PARTITION BY dept_id ORDER BY st_age )
FROM student

--lag and lead parameters
SELECT st_fname,dept_id,st_age,
	   stud_prev=lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),
	   stud_prev_diff=st_age-isnull(lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),0)
FROM student


SELECT st_fname,dept_id,st_age,
	   stud_prev=lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),
	   stud_prev_diff=isnull(st_age,0)-isnull(lAG(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),0),
	   stud_Next=LEAD(st_age) OVER(PARTITION BY dept_id ORDER BY st_age ),
	   stud_Next_diff=isnull(st_age,0)-isnull(LEAD(st_age) OVER(PARTITION BY dept_id ORDER BY st_age),0)
FROM student

SELECT st_fname,dept_id,st_age,
	   lowest=FIRST_VALUE(st_age) OVER(ORDER BY st_age),
	   Highest=LAST_VALUE(st_age) OVER(ORDER BY st_age ROWS BETWEEN unbounded preceding AND unbounded following),
	   stud_prev=lAG(st_age) OVER(ORDER BY st_age),
	   stud_Next=LEAD(st_age) OVER(ORDER BY st_age )
FROM student
