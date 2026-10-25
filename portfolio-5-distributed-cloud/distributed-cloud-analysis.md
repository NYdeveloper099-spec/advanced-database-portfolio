# Distributed and Cloud Database Analysis

## 1. Aim

The aim of this exercise was to examine how a cloud-hosted database can support the University Student Result Management System and to investigate the role of replication, availability, consistency, and scalability.

## 2. Practical Environment

The exercise used MongoDB Atlas and the existing `university_results` database, which contains a `students` collection.

The Atlas cluster overview displayed the following configuration:

- Cluster name: `Cluster0`
- Deployment type: Replica Set — 3 nodes
- Cloud provider and region: AWS / Cape Town (`af-south-1`)

The cluster overview screenshot records these displayed settings. A separate practical query was executed in Data Explorer to retrieve the student with student number `STU001`.

## 3. Practical Procedure and Results

The following filter was entered in MongoDB Atlas Data Explorer:

```javascript
{ student_number: "STU001" }
```

The query returned the student record for Ada Okafor. This confirmed that the record could be retrieved from the cloud-hosted collection during the exercise.

Two pieces of evidence were saved in the GitHub evidence folder:

1. `cluster-replica-set.png` — the cluster overview showing the three-node replica-set deployment and cloud region.
2. `student-record-verification.png` — the Data Explorer filter and returned student record.

The record retrieval was successful. However, this query tested data access only; it did not directly test replication between nodes.

## 4. Replication and Availability

A MongoDB replica set maintains multiple copies of data across its members. Under appropriate conditions, a replica set can elect a new primary if the existing primary becomes unavailable. This can help reduce disruption caused by an individual member failure.

For the university system, replication is relevant because student records and examination results are important operational data. A resilient deployment can help reduce the risk that a single database member failure makes those records unavailable.

The observed Atlas overview identified `Cluster0` as a three-node replica set. No node was deliberately stopped, and no failover test was performed. Therefore, this exercise documents the displayed replica-set configuration rather than claiming that failover was experimentally verified.

## 5. Consistency and Data Protection

Consistency is important when lecturers submit scores and administrators approve final results. Incorrect or conflicting result records could affect students' academic progress.

MongoDB read concern and write concern settings influence the consistency and durability guarantees available to database operations. A production deployment should choose suitable settings for critical result updates and validate data before publishing final grades.

The Atlas overview also displayed disaster recovery backups as inactive at the time of inspection. Backup configuration and restoration testing should be considered before using the system for critical academic records.

## 6. Sharding and Future Scalability

Sharding distributes data across multiple shards and may help support very large datasets and workloads. It could be considered if the university expands across campuses or accumulates substantial student and examination history.

The current deployment was identified as a replica set, not a sharded cluster. Sharding was therefore considered as a future scaling option and was not implemented in this exercise.

## 7. Limitations

The practical work confirmed that the Atlas cluster overview displayed a three-node replica set and that the existing student record was retrievable. The exercise did not measure query performance, deliberately cause a node failure, test automatic failover, restore a backup, or configure sharding.

These limitations mean that the discussion of failover, consistency, and scalability is based on the documented behaviour of the technologies, rather than on experiments performed in this exercise.

## 8. Conclusion

This exercise demonstrated the use of MongoDB Atlas as a cloud database environment for the University Student Result Management System. The observed three-node replica-set configuration provided a practical basis for discussing replication and availability, while the successful student lookup verified access to an existing record.

Before such a system is used for real examination results, the university should review backup and recovery arrangements, select appropriate read and write concerns, monitor the deployment, and perform controlled resilience tests.

## References

- MongoDB Documentation. *Replica Sets*. https://www.mongodb.com/docs/manual/replication/
- MongoDB Documentation. *Read Concern*. https://www.mongodb.com/docs/manual/reference/read-concern/
- MongoDB Documentation. *Write Concern*. https://www.mongodb.com/docs/manual/reference/write-concern/
- MongoDB Documentation. *Sharding*. https://www.mongodb.com/docs/manual/sharding/
