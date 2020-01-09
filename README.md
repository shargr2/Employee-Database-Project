#### Background

This research project deals with employee data of a corporation from the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

I designed tables to hold all data from the CSVs, imported the CSVs into a SQL database, and answered questions about the data, thereby performing Data Modeling, Data Engineering, and Data Analysis.

#### Data Modeling

I inspected the CSVs and sketched out an ERD of the tables using http://www.quickdatabasediagrams.com.

#### Data Engineering

* I created a table schema for each of the six CSV files specifying data types, primary keys, foreign keys, and other constraints and imported each CSV file into the corresponding SQL table.

#### Data Analysis

Now that I have a complete database, I generated queries to answer the following questions:

1. List the following details of each employee: employee number, last name, first name, gender, and salary.

2. List employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List all employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

