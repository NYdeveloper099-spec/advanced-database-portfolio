// Portfolio 4: NoSQL and Advanced Data Models
// Case Study: University Student Result Management System
// Database: university_results
// Collection: students
// Environment: MongoDB Atlas Data Explorer

// Query 1: Retrieve a student by student number
db.students.find({
  student_number: "STU001"
});

// Query 2: Find students with at least one embedded registration
// whose score is greater than or equal to 80
db.students.find({
  "registrations.score": { $gte: 80 }
});

// Query 3: Retrieve students in the Computer Science department
db.students.find({
  department: "Computer Science"
});

// Query 4: Return selected fields for student records
db.students.find(
  {},
  {
    _id: 0,
    student_number: 1,
    first_name: 1,
    last_name: 1,
    department: 1
  }
);

// Query 5: Find embedded registrations for a particular course
db.students.find({
  "registrations.course_code": "CSC801"
});
