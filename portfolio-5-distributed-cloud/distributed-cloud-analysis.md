# Distributed and Cloud Database Analysis

## 1. Aim

The aim of this exercise was to investigate how a cloud-hosted database can support the University Student Result Management System, with particular focus on replica-set deployment, data availability, consistency, and future scalability.

## 2. Practical Environment

The exercise used MongoDB Atlas and the existing `university_results` database, which contains a `students` collection.

The Atlas cluster overview displayed the following configuration:

- **Cluster name:** `Cluster0`
- **Deployment type:** Replica Set — 3 nodes
- **Cloud provider and region:** AWS, Cape Town (`af-south-1`)

The practical evidence consisted of two screenshots:

1. `cluster-replica-set.png` — showing the cluster's displayed replica-set configuration and cloud region.
2. `student-record-verification.png` — showing a successful student lookup in MongoDB Atlas Data Explorer.

## 3. Practical Procedure and Results

The following filter was entered in MongoDB Atlas Data Explorer:

```javascript
{ student_number: "STU001" }
```

The query returned the student record for Ada Okafor. This verified that the existing record was accessible through the cloud-hosted database during the exercise.

The cluster overview also showed a three-node replica-set deployment. This provided practical evidence of the configured cloud database environment. However, the student lookup did not independently verify that data had replicated between nodes.

## 4. Replication and Availability

Replication maintains copies of data across members of a MongoDB replica set. In a functioning replica set, the primary accepts writes and secondary members replicate changes. If the primary becomes unavailable, eligible members can participate in an election to select a new primary. This mechanism can help the system recover from an individual member failure.

For the University Student Result Management System, replication is relevant because student registrations, scores, and final grades are important academic records. A replicated deployment can improve resilience against the failure of an individual database member.

The Atlas overview displayed a three-node replica set. No member was deliberately stopped, and no failover test was performed. Therefore, the practical result confirms the displayed deployment configuration, not experimentally verified failover behaviour.

## 5. Consistency and Data Protection

Consistency is important when lecturers submit marks and administrators approve final results. Incorrect, stale, or conflicting records could affect students' academic progress.

MongoDB provides read concern and write concern settings that influence the guarantees associated with reading data and acknowledging writes. For critical result updates, the university should select appropriate settings, validate scores, and verify approved results before publishing transcripts.

The Atlas overview showed disaster recovery backups as inactive at the time of inspection. No backup restoration was performed. Before using the system for real academic records, the university should establish an appropriate backup and recovery procedure and test that records can be restored successfully.

## 6. Sharding and Future Scalability

Sharding distributes data across multiple machines and can support horizontal scaling when datasets or workloads become large. If the university expands across multiple campuses or accumulates substantial student and examination history, sharding could be evaluated as a future option.

The observed deployment was identified as a replica set, not a sharded cluster. Sharding was discussed as a possible future design choice but was not implemented or tested in this exercise.

## 7. Limitations

The practical work established that:

- The Atlas overview displayed a three-node replica-set deployment.
- The existing student record `STU001` could be retrieved successfully.
- The backup status shown in the overview was inactive.

The exercise did not deliberately cause a node failure, measure failover behaviour, restore a backup, configure sharding, or compare consistency settings experimentally. These limitations are acknowledged so that the analysis does not present proposed capabilities as tested results.

## 8. Conclusion

This exercise demonstrated the use of MongoDB Atlas as a cloud-hosted database environment for the University Student Result Management System. The displayed three-node replica-set configuration provided a practical basis for analysing replication and availability, while the successful student lookup confirmed access to an existing academic record.

The exercise also identified important operational considerations, including backup and recovery, appropriate read and write concerns, and future scalability. Before the system is used for actual examination results, these areas should be configured and tested according to the university's reliability and data protection requirements.

## References

- MongoDB. *Replication*. https://www.mongodb.com/docs/manual/replication/
- MongoDB. *Read Concern*. https://www.mongodb.com/docs/manual/reference/read-concern/
- MongoDB. *Write Concern*. https://www.mongodb.com/docs/manual/reference/write-concern/
- MongoDB. *Sharding*. https://www.mongodb.com/docs/manual/sharding/
