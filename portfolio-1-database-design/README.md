# Portfolio 1: Database Design and Modelling

## 1. Introduction

This portfolio presents the design of a relational database for a University Student Result Management System. The system is designed to store and manage student details, departments, lecturers, courses, course registrations, and examination results.

The main objective is to develop a database structure that minimises data duplication, maintains data integrity, and supports the efficient retrieval of academic records.

## 2. Database Requirements

The system is designed to support the following operations:

- Register and maintain student records.
- Organise students and courses by department.
- Store lecturer and course information.
- Register students for courses.
- Record examination scores and grades.
- Retrieve student results for academic reporting.

## 3. Proposed Entities

The database design contains six main entities:

| Entity | Purpose |
|---|---|
| Students | Stores student identification and personal details. |
| Departments | Stores academic department information. |
| Lecturers | Stores lecturer information. |
| Courses | Stores courses offered by departments. |
| Registrations | Records students registered for courses. |
| Results | Stores assessment scores and grades associated with registrations. |

## 4. Relationships

The database design includes the following relationships:

- A department can have many students.
- A department can offer many courses.
- A department can employ many lecturers.
- A student can register for many courses.
- A course can have many student registrations.
- Each registration can have an associated result.

The relationship between students and courses is many-to-many and is implemented through the Registrations entity. This entity connects students to the courses for which they register.

## 5. Keys and Constraints

Primary keys uniquely identify records in each table. Foreign keys link related tables and enforce referential integrity. Unique constraints prevent duplicate student numbers and course codes. Check constraints are used to validate appropriate score ranges and other required values.

These constraints help maintain the accuracy and consistency of academic records. The implementation of the constraints is documented in the database schema.

## 6. Normalisation

The database design aims to satisfy Third Normal Form (3NF). Each table represents a single entity or relationship, repeating groups are avoided, and non-key attributes are intended to depend on the key, the whole key, and nothing but the key.

This approach helps reduce data duplication and update anomalies while maintaining a consistent structure for storing university academic records.

## 7. Implementation and Testing

The database design was implemented using PostgreSQL. SQL scripts define the tables and constraints, insert sample records, and test the relationships between the entities.

The ER diagram, SQL implementation, test queries, and supporting screenshots provide evidence of the database design and implementation.

## 8. Conclusion

The relational database design provides a structured foundation for managing university academic records. It supports the organisation of student, department, lecturer, course, registration, and result information.

The design also provides a foundation for the subsequent portfolio activities involving query processing and optimisation, transactions and concurrency, NoSQL data modelling, and distributed and cloud databases.
