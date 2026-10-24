# Portfolio 4: NoSQL and Advanced Data Models — Analysis

## 1. Introduction

This portfolio continues the University Student Result Management System used in the earlier portfolios. The practical exercise explores how MongoDB stores student and academic information in document form.

MongoDB Atlas was used to create the `university_results` database and its `students` collection.

## 2. Document Model

One student document was inserted with the following information:

- **Student number:** `STU001`
- **First name:** Ada
- **Last name:** Okafor
- **Department:** Computer Science
- **Embedded registrations:** Two course records

Each embedded registration contains a course code, course title, score, and grade. Embedding these registrations allows related academic information to be stored alongside the student's main details.

## 3. Practical Queries and Observations

### Query 1: Student Lookup

**Filter:**

```javascript
{ "student_number": "STU001" }
```

**Observation:** The query returned the document for Ada Okafor.

**Interpretation:** MongoDB retrieves documents by matching field values. The student number serves as a useful lookup field for finding an individual student record.

### Query 2: Embedded Score Filter

**Filter:**

```javascript
{ "registrations.score": { "$gte": 80 } }
```

**Observation:** The query returned the student document.

**Interpretation:** MongoDB supports filtering on fields inside embedded arrays. The document matched because one registration had a score of 85, which satisfies the condition of being greater than or equal to 80.

### Query 3: Department Filter

**Filter:**

```javascript
{ "department": "Computer Science" }
```

**Observation:** The query returned the student record belonging to the Computer Science department.

**Interpretation:** MongoDB can filter documents using a department field. This is useful when retrieving student records associated with a particular academic department.

### Query 4: Projection

**Projection:**

```javascript
{
  _id: 0,
  student_number: 1,
  first_name: 1,
  last_name: 1,
  department: 1
}
```

**Observation:** The result displayed the selected student fields while excluding the `_id` field.

**Interpretation:** Projection controls which fields are included in a query result. This can make outputs easier to read and avoid returning fields that are not required for a particular task.

In this example, the projection returns the student's number, first name, last name, and department without displaying the MongoDB-generated document identifier.

### Query 5: Course Registration Filter

**Filter:**

```javascript
{ "registrations.course_code": "CSC801" }
```

**Observation:** The query returned the student document for Ada Okafor (`STU001`).

**Interpretation:** MongoDB can filter documents using a field nested inside an embedded array. The query identified the student document containing a registration with the course code `CSC801`.

This is useful in the University Student Result Management System because it can help identify students registered for a particular course without requiring a relational join. The screenshot of the query result is stored in the evidence folder.

## 4. Embedding Related Data

The two course registrations are embedded inside the student document. This makes it possible to retrieve the student and their registrations together in one document query.

Embedding can be useful when related information is frequently read together. It can reduce the need for separate queries or joins when the application commonly accesses student and registration information as a single unit.

However, if registrations grow substantially, need to be updated independently, or are shared across multiple records, a separate registrations collection with references may be more appropriate.

The choice between embedding and referencing depends on the relationships between the data, expected document size, update patterns, and query requirements.

## 5. Comparison with the Relational Model

In the earlier relational design, students, courses, registrations, and results were represented using separate tables connected by keys. MongoDB can instead store selected related information in a single document.

The relational approach provides structured relationships, constraints, and support for joins across tables. The document approach offers a flexible structure and can simplify retrieval when related information is stored together.

For the University Student Result Management System, a relational database remains useful for maintaining relationships among students, courses, registrations, and results. MongoDB embedding can also be useful when student details and a manageable set of related registration records are frequently retrieved together.

Neither approach is automatically better in every situation. The most appropriate model depends on data relationships, consistency requirements, expected data growth, and application query patterns.

## 6. Limitations

The practical exercise used one sample student document. The student lookup, embedded-score filter, department filter, projection, and course registration filter were executed in MongoDB Atlas Data Explorer.

The dataset is small and contains only one student document, so the exercise demonstrates query syntax and document modelling rather than performance at scale. It does not provide enough data to draw reliable conclusions about query performance, scalability, or the benefits of indexing.

The queries demonstrate filtering and projection on a document and its embedded registration fields. A larger dataset and additional testing would be required to compare alternative document structures or measure performance under realistic workloads.

## 7. Conclusion

This portfolio demonstrated how MongoDB stores student information and embedded course registrations in a document-oriented structure. Five queries were prepared, and the practical results documented student lookup, score filtering, department filtering, projection, and filtering by an embedded course code.

The exercise illustrates how a document database can retrieve related academic information stored within a student document. It also highlights the differences between MongoDB's document model and the relational model developed in earlier portfolios.

The University Student Result Management System remains the case study throughout the portfolio, providing continuity between relational database design and NoSQL data modelling.
