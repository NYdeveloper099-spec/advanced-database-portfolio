# Portfolio 1: Database Design and Modelling

## 1. Introduction

This portfolio designs a relational database for a University Student Result Management System. The system will store and manage student details, departments, lecturers, courses, course registrations, and examination results.

The main objective is to develop a database structure that minimises data duplication, maintains data integrity, and supports efficient retrieval of academic records.

## 2. Database Requirements

The system must support the following operations:

- Register and maintain student records.
- Organise students and courses by department.
- Store lecturer and course information.
- Register students for courses.
- Record examination scores and grades.
- Retrieve student results for academic reporting.

## 3. Proposed Entities

The initial database design contains six entities:

| Entity | Purpose |
|---|---|
| Students | Stores student identification and personal details. |
| Departments | Stores academic department information. |
| Lecturers | Stores lecturer information. |
| Courses | Stores courses offered by departments. |
| Registrations | Records students registered for courses. |
| Results | Stores assessment scores and grades. |

## 4. Relationships

- A department can have many students.
- A department can offer many courses.
- A department can employ many lecturers.
- A student can register for many courses.
- A course can have many student registrations.
- Each registration can have an associated result.

The relationship between students and courses is many-to-many and is implemented through the Registrations entity.

## 5. Keys and Constraints

Primary keys uniquely identify records in each table. Foreign keys link related tables and enforce referential integrity. Unique constraints prevent duplicate student numbers and course codes. Check constraints will validate appropriate score ranges and other required values.

## 6. Normalisation

The database will be designed to satisfy Third Normal Form (3NF). Each table will represent a single entity or relationship, repeating groups will be avoided, and non-key attributes will depend on the key, the whole key, and nothing but the key.

## 7. Implementation and Testing

The design will be implemented using PostgreSQL. SQL scripts will create the tables and constraints, insert sample records, and test the relationships. An ER diagram and screenshots of successful execution will provide supporting evidence.

## 8. Conclusion

The proposed relational design provides a structured foundation for managing university academic records. It will also support the later portfolio activities involving query optimisation, transactions, NoSQL modelling, and distributed databases.

