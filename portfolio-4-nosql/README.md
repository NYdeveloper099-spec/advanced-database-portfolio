# Portfolio 4: NoSQL and Advanced Data Models

## 1. Case Study

This portfolio continues the University Student Result Management System developed in the previous portfolios. The system manages student information, departments, courses, registrations, lecturers, and academic results.

The practical exercise explores how MongoDB can represent and retrieve student academic information using a document-oriented data model. It also compares the MongoDB approach with the relational database design developed in the earlier portfolios.

## 2. Aim

The aim of this portfolio is to explore how a NoSQL database can represent and query student academic information, and to compare the document-based approach with the relational database model used in the University Student Result Management System.

## 3. Objectives

The objectives of this portfolio are to:

- Explain the purpose and characteristics of NoSQL databases.
- Design a document-based data model for student academic records.
- Insert and query sample student and academic information.
- Demonstrate filtering and projection using MongoDB Query Language (MQL).
- Explore the use of embedded documents for related academic information.
- Compare the document model with the existing relational model.
- Document practical results, screenshots, observations, and limitations.

## 4. Tools and Environment

The following tools and environment were used:

- **Database:** MongoDB
- **Platform:** MongoDB Atlas
- **Query interface:** MongoDB Atlas Data Explorer
- **Query language:** MongoDB Query Language (MQL)
- **Database:** `university_results`
- **Collection:** `students`
- **Version control and documentation:** GitHub

## 5. Document Model

A sample student document was created in the `students` collection.

The document contains the following information:

- Student number: `STU001`
- First name: Ada
- Last name: Okafor
- Department: Computer Science
- Embedded registrations: Two course records

Each embedded registration contains a course code, course title, score, and grade.

The sample document uses embedding to store related course-registration information alongside the student's main details. This allows the student record and its embedded registrations to be retrieved together.

The document structure and equivalent insertion command are documented in `documents.js`.

## 6. Practical Activities

The following activities were completed using MongoDB Atlas Data Explorer:

1. Created the `university_results` database and the `students` collection.
2. Inserted a sample student document containing two embedded course registrations.
3. Retrieved a student using the student number `STU001`.
4. Filtered student documents using an embedded registration score greater than or equal to 80.
5. Retrieved student records belonging to the Computer Science department.
6. Used projection to return selected student fields while excluding the `_id` field.
7. Filtered student documents using the embedded course code `CSC801`.
8. Documented the query results and observations.
9. Compared the MongoDB document model with the relational design used in the earlier portfolios.

The MongoDB queries are documented in `queries.js`.

## 7. Practical Queries and Observations

Five MongoDB queries were prepared and executed.

| Query | Purpose |
|---|---|
| Student lookup | Retrieve a student using `student_number = "STU001"` |
| Embedded score filter | Find student documents with at least one registration score greater than or equal to 80 |
| Department filter | Retrieve students in the Computer Science department |
| Projection | Return selected student fields while excluding `_id` |
| Course registration filter | Find student documents containing a registration with course code `CSC801` |

The queries demonstrated MongoDB filtering, projection, and access to fields inside embedded arrays.

The embedded-score query returned the matching student document rather than only the individual registration that satisfied the score condition.

The course-registration query demonstrated how MongoDB can identify a student document using a course code stored inside an embedded registration.

The detailed observations and interpretations are documented in `analysis.md`.

## 8. Embedding and Relational Model Comparison

The MongoDB document model stores selected related information within a single student document. This can simplify retrieval when student details and their registrations are frequently accessed together.

In the earlier relational design, students, registrations, courses, and results were stored in separate tables connected by primary and foreign keys. Retrieving related information required joins across the relevant tables.

Embedding can reduce the need for separate queries or joins when related information is stored together. However, referencing may be more appropriate when related records grow substantially, are updated independently, or are shared across multiple documents.

The relational model provides structured relationships and supports constraints across tables. The document model provides flexibility and can simplify retrieval for suitable application query patterns.

Neither approach is automatically better in every situation. The appropriate design depends on data relationships, consistency requirements, expected data growth, update patterns, and query requirements.

## 9. Evidence and Documentation

The portfolio includes the following documentation and evidence:

- `documents.js` — sample student document structure and equivalent insertion command.
- `queries.js` — MongoDB queries used in the practical exercise.
- `analysis.md` — detailed analysis of the document model, query results, embedding, relational comparison, and limitations.
- `evidence/README.md` — description and links to the practical screenshots.

The evidence folder contains screenshots documenting:

1. Student lookup by student number.
2. Filtering by embedded registration score.
3. Department filtering.
4. Projection of selected student fields.
5. Filtering by embedded course registration.

The screenshots provide evidence of the practical queries performed in MongoDB Atlas Data Explorer.

## 10. Limitations

The practical exercise used one sample student document containing two embedded course registrations.

The queries demonstrated document retrieval, filtering, projection, and filtering by embedded fields. However, the small dataset does not provide sufficient evidence to draw reliable conclusions about performance at scale, scalability, or indexing benefits.

The exercise did not include a measured performance comparison between alternative document structures or a large-scale workload.

Further testing with a larger dataset and additional query patterns would be required to evaluate performance and scalability under realistic conditions.

## 11. Conclusion

This portfolio provided practical experience with MongoDB and document-based data modelling. It demonstrated how student information and embedded course registrations can be stored and queried using MongoDB Atlas Data Explorer.

The five queries illustrated student lookup, embedded-score filtering, department filtering, projection, and filtering by an embedded course code.

The exercise also highlighted the differences between a document-oriented database and the relational database design developed in the earlier portfolios. It showed that embedding can simplify retrieval of related information, while relational tables remain useful for maintaining structured relationships and constraints.

The University Student Result Management System remains the case study throughout the Advanced Database Systems portfolio, providing continuity between relational database design and NoSQL data modelling.
