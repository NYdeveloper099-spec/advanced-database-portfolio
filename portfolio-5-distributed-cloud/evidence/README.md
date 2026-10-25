# Portfolio 5 Evidence

## 1. MongoDB Atlas Cloud Deployment and Replica Set

**Screenshot:** `cluster-replica-set.png`

This screenshot shows the MongoDB Atlas Clusters page for `Cluster0`. The overview identifies the deployment type as **Replica Set – 3 nodes** and shows the cloud region as **AWS / Cape Town (`af-south-1`)**.

This evidence supports the discussion of cloud database deployment and replication in Portfolio 5. It confirms the configuration displayed in Atlas; it does not demonstrate a deliberately tested node failure, automatic failover, or backup restoration.

## Evidence limitations

The screenshot documents the cluster configuration visible at the time of inspection. Further testing would be required to measure failover behaviour, validate recovery, or assess performance under concurrent workloads.



## 2. Cloud Database Student Record Verification

**Screenshot:** `student-record-verification.png`

This screenshot shows a query executed in MongoDB Atlas Data Explorer using the filter `{ student_number: "STU001" }`. The query returned the existing student record for Ada Okafor from the `students` collection in the `university_results` database.

This practical check confirms that the student record could be retrieved from the cloud-hosted database during the exercise. It does not independently demonstrate replication, failover, or recovery from a node failure.
