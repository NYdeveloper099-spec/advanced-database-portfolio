// Portfolio 4: NoSQL and Advanced Data Models
// Case Study: University Student Result Management System
// Database: university_results
// Collection: students
// Environment: MongoDB Atlas

// Sample student document used in the practical exercise.
// The document was inserted through MongoDB Atlas Data Explorer.

// Example document structure:
{
  student_number: "STU001",
  first_name: "Ada",
  last_name: "Okafor",
  department: "Computer Science",
  registrations: [
    {
      course_code: "CSC801",
      course_title: "Advanced Database Systems",
      score: 85,
      grade: "A"
    },
    {
      course_code: "CSC802",
      course_title: "Data Management",
      score: 78,
      grade: "B"
    }
  ]
}

// Equivalent insertion command for mongosh.
// Run only if you want to insert this sample into a fresh collection.
// If STU001 already exists, this command will create a duplicate student
// document because student_number is not currently a unique index.

// db.students.insertOne({
//   student_number: "STU001",
//   first_name: "Ada",
//   last_name: "Okafor",
//   department: "Computer Science",
//   registrations: [
//     {
//       course_code: "CSC801",
//       course_title: "Advanced Database Systems",
//       score: 85,
//       grade: "A"
//     },
//     {
//       course_code: "CSC802",
//       course_title: "Data Management",
//       score: 78,
//       grade: "B"
//     }
//   ]
// });
