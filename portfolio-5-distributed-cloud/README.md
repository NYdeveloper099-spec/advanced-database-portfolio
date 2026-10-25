# Portfolio 5: Distributed and Cloud Databases

## Case Study: University Student Result Management System

### 1. Introduction

This portfolio examines how distributed and cloud database technologies can support a University Student Result Management System. The system stores student details, departments, course registrations, scores, and grades. Its users include students, lecturers, and university administrators.

The system needs reliable access to student records and examination results. A cloud database deployment can help support availability, resilience, and access to data while reducing the need for the university to manage all database infrastructure itself.

### 2. Cloud Database Environment

The practical environment for this exercise is MongoDB Atlas. The database used in the case study is `university_results`, and the existing collection is `students`.

The Atlas cluster overview showed the following configuration:

- **Cluster name:** `Cluster0`
- **Deployment type:** Replica Set — 3 nodes
- **Cloud provider and region:** AWS / Cape Town (`af-south-1`)
- **Database:** `university_results`
- **Collection:** `students`

These details were observed in the MongoDB Atlas cluster overview. The configuration screenshot is intended to serve as evidence of the cloud deployment and the displayed replica-set topology.

### 3. Replication

Replication maintains copies of database data across members of a replica set. In a MongoDB replica set, one member normally acts as the primary and accepts writes, while secondary members replicate changes from the primary.

For the University Student Result Management System, replication can help the university maintain access to student and result data if a database member becomes unavailable. MongoDB replica sets can elect a new primary when the current primary becomes unavailable, provided the necessary election and majority conditions are met.

The Atlas overview identifies the deployment as a three-node replica set. This confirms the displayed deployment type, but this exercise does not claim to have deliberately stopped a node or tested a failover.

### 4. Availability and Consistency

Availability is important because students and university staff may need to retrieve results during registration and examination periods. A replica set can improve resilience to individual member failures, although availability is not guaranteed under every failure or network condition.

Consistency concerns whether clients observe the expected database values and ordering of changes. MongoDB provides read and write concern settings that influence the consistency and durability guarantees of operations. The appropriate settings depend on the university's requirements, particularly when recording final examination scores.

For important result updates, the university should select suitable write concern and read concern settings, validate updates, and retain appropriate backups. The cluster overview showed that disaster recovery backups were marked as inactive at the time of inspection; backup configuration should therefore be reviewed before the system is used for critical university records.

### 5. Sharding and Scalability

Sharding distributes data across multiple shards to support very large datasets and workloads. It may become useful if the university expands to many campuses, students, courses, and years of examination records. A shard key must be selected carefully to distribute data and queries effectively.

The observed deployment is identified as a three-node replica set, not a sharded cluster. Sharding was discussed as a possible future scaling strategy; it was not configured or tested in this exercise.

### 6. Evidence and Limitations

The Atlas cluster overview provides evidence of the deployment name, region, and three-node replica-set type. Additional screenshots or tests should be added if further configuration details are inspected.

The practical exercise did not intentionally cause a node failure, measure failover time, configure sharding, or verify backup restoration. These activities are outside the evidence collected so far. The conclusions therefore distinguish the observed Atlas configuration from the expected benefits and general behaviour of distributed database technologies.

### 7. Conclusion

MongoDB Atlas provides a managed cloud environment for the University Student Result Management System. The observed three-node replica set provides a practical example for discussing replication and resilience. Appropriate consistency settings, backup planning, access controls, monitoring, and further failure testing would be necessary before relying on the deployment for critical examination results.

### References

- MongoDB Documentation. *Replica Sets*. https://www.mongodb.com/docs/manual/replication/
- MongoDB Documentation. *Read Concern*. https://www.mongodb.com/docs/manual/reference/read-concern/
- MongoDB Documentation. *Write Concern*. https://www.mongodb.com/docs/manual/reference/write-concern/
- MongoDB Documentation. *Sharding*. https://www.mongodb.com/docs/manual/sharding/
