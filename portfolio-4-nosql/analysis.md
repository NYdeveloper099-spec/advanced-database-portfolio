# Portfolio 4: NoSQL and Advanced Data Models — Analysis

## 1. Introduction

This portfolio continues the University Student Result Management System used in the earlier portfolios. The practical exercise explores how MongoDB stores student and academic information in document form.

MongoDB Atlas was used to create the `university_results` database and its `students` collection.

## 2. Document Model

One student document was inserted with the following information:

- Student number: `STU001`
- First name: Ada
- Last name: Okafor
- Department: Computer Science
- Embedded registrations: two course records

Each embedded registration contains a course code, course title, score, and grade.

## 3. Practical Queries and Observations

### Query 1: Student lookup

Filter:

`{ "student_number": "STU001" }`

**Observation:** The query returned the document for Ada Okafor.

**Interpretation:** MongoDB can retrieve a document by matching a field value. This demonstrates filtering using a student identifier.

### Query 2: Embedded score filter

Filter:

`{ "registrations.score": { "$gte": 80 } }`

**Observation:** The query returned the student document.

**Interpretation:** MongoDB supports queries against fields within embedded arrays. The document matched because one registration had a score of 85, which is greater than or equal to 80.

## 4. Embedding Related Data

The two course registrations are embedded inside the student document. This makes it possible to retrieve the student and their registrations together in one document query.

Embedding can be useful when related information is frequently read together. However, if registrations grow substantially or need to be managed independently, a separate registrations collection with references may be more appropriate.

## 5. Comparison with the Relational Model

In the earlier relational design, students, courses, registrations, and results were represented using separate tables connected by keys. MongoDB can instead store selected related information in a single document.

The relational approach provides structured relationships and supports joins across tables. The document approach offers flexibility and can simplify retrieval of related data stored together. The best choice depends on data relationships, update patterns, consistency requirements, and query needs.

## 6. Limitations

The practical test used one sample student document. The two documented filters were executed in MongoDB Atlas Data Explorer. The other queries in `queries.js` are prepared examples and should not be considered tested until executed.

The small dataset is suitable for demonstrating document structure and query syntax, but it is insufficient for reliable performance comparisons or conclusions about scalability.

## 7. Conclusion

The practical exercise demonstrated creating a MongoDB collection, inserting a student document with embedded registrations, retrieving a student by student number, and filtering documents using a score inside an embedded array.

The exercise illustrates an alternative to the relational model used in the earlier portfolios while maintaining the same university results management case study.
