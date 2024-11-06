-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Dept_no" int   NOT NULL,
    "Dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_no" int   NOT NULL,
    "Dept_no" int   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_no" int   NOT NULL,
    "Emp_no" int   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_no" int   NOT NULL,
    "Emp_title_id" int   NOT NULL,
    "Birth_date" date   NOT NULL,
    "First_name" varchar(255)   NOT NULL,
    "Last_name" varchar(255)   NOT NULL,
    "Sex" varchar(1)   NOT NULL,
    "Hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" int   NOT NULL,
    "Salary" money   NOT NULL
);

CREATE TABLE "Titles" (
    "Title_id" int   NOT NULL,
    "Title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_title_id" FOREIGN KEY("Emp_title_id")
REFERENCES "Titles" ("Title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

