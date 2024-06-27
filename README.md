# PL/SQL Fundamentals

PL/SQL (Procedural Language/Structured Query Language) is Oracle Corporation's procedural extension for SQL and the Oracle relational database. It combines SQL statements with procedural constructs, such as variables, loops, conditional statements, and exception handling, facilitating the development of powerful and efficient database applications.

## Data Types

### Scalar Data Types
- **INTEGER**: Stores whole numbers within a specified range.
- **NUMBER**: Represents numeric values with optional precision and scale.
- **VARCHAR2 / CHAR**: Used for storing character strings of variable or fixed length, respectively.
- **BOOLEAN**: Holds Boolean values (TRUE, FALSE, or NULL).
- **DATE / TIMESTAMP**: Stores date and time values with optional time zone information.
- **BINARY_INTEGER**: Similar to INTEGER but limited to smaller values.

### Composite Data Types
- **%TYPE**: Declares variables with the same data type as a specified database column or variable.
- **%ROWTYPE**: Represents a complete row of data in a table or cursor result set.
- **RECORD**: Defines a user-defined data structure with multiple fields of different data types.

### Collection Data Types
- **Nested Tables**: Unordered collections of elements of the same data type.
- **VARRAY (Variable-size Array)**: Arrays of a fixed maximum size, storing elements of the same data type.
- **Associative Arrays (Index-by Tables)**: Collections of key-value pairs where the key is unique and can be of any scalar data type.

### LOB Data Types
- **CLOB (Character Large Object)**: Stores large blocks of character data, such as text documents.
- **BLOB (Binary Large Object)**: Holds large blocks of binary data, such as images or multimedia files.
- **BFILE**: Represents binary files stored outside the database.

### REF CURSOR
- A special data type used to hold the result set returned by a query. It allows dynamic SQL queries to be executed and processed within PL/SQL programs.

## Control Statements

### IF-THEN-ELSE Statement
Executes a block of code conditionally based on a specified condition.

### CASE Statement
Evaluates a set of conditions and executes the corresponding code block based on the first condition that evaluates to true.

### LOOP Statements
- **LOOP**: Creates an infinite loop that continues until explicitly terminated using an EXIT statement.
- **WHILE**: Executes a block of code repeatedly as long as a specified condition remains true.
- **FOR**: Iterates over a range of values or a collection and executes the loop body for each iteration.

### EXIT Statements
Used to exit a loop prematurely based on a specified condition.

### GOTO Statement
Transfers control to a specified label within the same block, subprogram, or package.

### Exception Handling
Includes mechanisms to gracefully handle errors and unexpected conditions during program execution.

## String Functions

### CONCAT
Concatenates two or more strings together.

### SUBSTR
Extracts a substring from a string based on the source string, starting position, and length of the substring.

## WHILE Loop

Repeatedly executes a block of code as long as a specified condition evaluates to true. The loop continues until the condition evaluates to false.

## Cursors

Used to retrieve and process multiple rows returned by a SQL query. Supports both implicit and explicit cursors.

## Triggers

Automatically executed in response to specific events occurring in the database, such as INSERT, UPDATE, or DELETE operations. Useful for enforcing data integrity rules and implementing complex business logic.

## Exception Handling

Allows handling of runtime errors gracefully. Provides built-in exceptions and custom exceptions using the EXCEPTION keyword.

## Packages

Schema objects that group logically related PL/SQL types, variables, constants, cursors, exceptions, procedures, and functions into a single unit. They provide modularity, encapsulation, and namespace management, making code maintenance easier.

## Object-Oriented Programming

### User-Defined Types (UDTs)
Defines abstract data types using the CREATE TYPE statement.

### Object Types
Encapsulates data and behavior, allowing modeling of real-world entities as objects.

### Object Views
Presents relational data as objects, enabling interaction with relational data using object-oriented concepts.

### Inheritance
Allows object types to inherit attributes and methods from parent types.

### Encapsulation
Encapsulates data and behavior within object types to enforce data abstraction and control access.

### Polymorphism
Supports method overloading and overriding within object types.
