CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(4)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(40)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);


CREATE TABLE "departments" (
	"dept_no" varchar(4)   NOT NULL,
	"dept_name" varchar(30) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
	)
);


CREATE TABLE "dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_no"
     )
);

---Join all tables

select dept_emp.emp_no, dept_emp.dept_no, dept_emp.from_date as emp_from, dept_emp.to_date as emp_to, employees.first_name,
employees.last_name, employees.birth_date, employees.gender, employees.hire_date, departments.dept_name,
salaries.salary, titles.title, titles.from_date as title_from, titles.to_date as title_to, salaries.from_date as salary_from,
salaries.to_date as salary_to, dept_manager.from_date as manager_from, dept_manager.to_date as manager_to
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no


---List the following details of each employee: employee number, last name, first name, gender, and salary.

select dept_emp.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no

---List employees who were hired in 1986.

select dept_emp.emp_no, dept_emp.dept_no, dept_emp.from_date as emp_from, dept_emp.to_date as emp_to, employees.first_name,
employees.last_name, employees.birth_date, employees.gender, employees.hire_date, departments.dept_name,
salaries.salary, titles.title, titles.from_date as title_from, titles.to_date as title_to, salaries.from_date as salary_from,
salaries.to_date as salary_to, dept_manager.from_date as manager_from, dept_manager.to_date as manager_to
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no
where (employees.hire_date BETWEEN '1986-01-01'AND '1986-12-31')

---List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_manager.emp_no, employees.first_name, employees.last_name, departments.dept_name, dept_manager.dept_no,
dept_manager.from_date as manager_from, dept_manager.to_date as manager_to
from dept_manager
left outer join dept_emp on dept_manager.emp_no = dept_emp.emp_no
left outer join departments on dept_manager.dept_no = departments.dept_no
left outer join employees on dept_manager.emp_no = employees.emp_no



---List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no

---List all employees whose first name is "Hercules" and last names begin with "B."
select dept_emp.emp_no, dept_emp.dept_no, dept_emp.from_date as emp_from, dept_emp.to_date as emp_to, employees.first_name,
employees.last_name, employees.birth_date, employees.gender, employees.hire_date, departments.dept_name,
salaries.salary, titles.title, titles.from_date as title_from, titles.to_date as title_to, salaries.from_date as salary_from,
salaries.to_date as salary_to, dept_manager.from_date as manager_from, dept_manager.to_date as manager_to
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no
where employees.first_name = 'Hercules' and employees.last_name LIKE 'B%'

---List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name,employees.last_name, departments.dept_name
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no
where departments.dept_name = 'Sales'

---List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name,employees.last_name, departments.dept_name
from dept_emp
left outer join employees on dept_emp.emp_no = employees.emp_no
left outer join departments on dept_emp.dept_no = departments.dept_no
left outer join dept_manager on dept_emp.emp_no = dept_manager.emp_no
left outer join salaries on dept_emp.emp_no = salaries.emp_no
left outer join titles on dept_emp.emp_no = titles.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

---In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name, count(*)
from employees
GROUP BY last_name
ORDER BY last_name DESC;
