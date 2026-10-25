# Portfolio 5: Distributed and Cloud Databases

## Case Study: University Student Result Management System

### 1. Overview

This portfolio examines how cloud database deployment, replication, availability, consistency, and scalability can support a University Student Result Management System.

The system stores student details, course registrations, scores, and grades. MongoDB Atlas was used to explore a cloud-hosted database deployment.

### 2. Environment

- **Platform:** MongoDB Atlas
- **Cluster:** `Cluster0`
- **Deployment type displayed:** Replica Set — 3 nodes
- **Cloud provider and region:** AWS / Cape Town (`af-south-1`)
- **Database:** `university_results`
- **Collection:** `students`

### 3. Practical Work

The practical exercise included:

1. Inspecting the existing MongoDB Atlas cluster overview.
2. Recording the displayed replica-set configuration.
3. Querying the `students` collection using the student number `STU001`.
4. Verifying that the query returned the existing student record.

The student lookup succeeded. The exercise did not deliberately interrupt a node or test failover, backup restoration, or sharding.

### 4. Project Documentation

- [Distributed and Cloud Database Analysis](distributed-cloud-analysis.md)
- [Evidence Documentation](evidence/README.md)
- [Cluster Replica Set Screenshot](evidence/cluster-replica-set.png)
- [Student Record Verification Screenshot](evidence/student-record-verification.png)

### 5. Key Findings

The Atlas overview provided practical evidence of a cloud deployment identified as a three-node replica set. The successful student lookup demonstrated that the existing student record was accessible through Atlas Data Explorer.

Replica sets can support redundancy and availability, while read concern and write concern settings influence database consistency and durability guarantees. Sharding may support future growth, but it was not configured in this exercise.

The cluster overview displayed disaster recovery backups as inactive at the time of inspection. Backup and recovery arrangements should be reviewed before the system is used for critical university examination results.

### 6. Limitations

This exercise recorded the replica-set configuration displayed by MongoDB Atlas and successfully retrieved an existing student record. It did not independently verify data replication between replica-set members. It did not experimentally verify replication, automatic failover, backup restoration, sharding, or performance under concurrent workloads. These limitations are explained in the analysis file.

### 7. Conclusion

MongoDB Atlas provides a managed cloud database environment suitable for studying distributed database concepts. The observed replica-set deployment illustrates how replication can support resilience, while suitable consistency settings, backup planning, monitoring, and further testing remain important for protecting university result data.

### 8. References

- MongoDB Documentation. *Replica Sets*. https://www.mongodb.com/docs/manual/replication/
- MongoDB Documentation. *Read Concern*. https://www.mongodb.com/docs/manual/reference/read-concern/
- MongoDB Documentation. *Write Concern*. https://www.mongodb.com/docs/manual/reference/write-concern/
- MongoDB Documentation. *Sharding*. https://www.mongodb.com/docs/manual/sharding/
