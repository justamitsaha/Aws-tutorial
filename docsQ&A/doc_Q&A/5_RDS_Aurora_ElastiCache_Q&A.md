# 🎤 AWS Certified Solutions Architect: RDS, Aurora & ElastiCache Q&A

---

### 🔹 1. RDS Managed Service Overview
**Q:** What are the benefits of using RDS over running a database on an EC2 instance?

**Answer:**
- **Managed Provisioning:** Automatic DB setup and OS patching.
- **Continuous Backups:** Restore to any point in time (PITR).
- **High Availability:** Easy Multi-AZ setup for disaster recovery.
- **Scalability:** Read replicas for horizontal read scaling and vertical scaling for CPU/RAM.
- **Storage:** Managed by EBS; support for Storage Auto Scaling.
- *Limitation:* No SSH access to the underlying OS.

---

### 🔹 2. RDS Read Replicas vs. Multi-AZ
**Q:** Compare RDS Read Replicas and Multi-AZ deployments.

**Answer:**
- **Read Replicas:**
    - **Purpose:** Horizontal scaling for **read-heavy** workloads.
    - **Replication:** Asynchronous (eventual consistency).
    - **Scope:** Within an AZ, Cross-AZ, or Cross-Region.
    - **Promotion:** Can be promoted to a standalone database.
- **Multi-AZ:**
    - **Purpose:** High Availability and **Disaster Recovery (DR)**.
    - **Replication:** Synchronous.
    - **Behavior:** One DNS endpoint; automatic failover to the standby in a different AZ if the primary fails.

---

### 🔹 3. RDS Storage Auto Scaling
**Q:** How does RDS Storage Auto Scaling work?

**Answer:**
- Automatically increases the allocated EBS storage when free space is low.
- **Thresholds:** Triggered if free storage is < 10% of allocated space and low storage lasts for at least 5 minutes.
- **Limit:** You must set a **Maximum Storage Threshold**.

---

### 🔹 4. Aurora Overview (AWS Proprietary)
**Q:** What makes Amazon Aurora different from standard RDS?

**Answer:**
- **Performance:** 5x faster than standard MySQL and 3x faster than standard PostgreSQL.
- **Storage Architecture:** Data is stored in a shared volume spanning **3 AZs**, with 6 copies total.
- **Self-Healing:** Data is automatically repaired and replicated.
- **Replicas:** Up to 15 Read Replicas (compared to 5 in RDS); replication lag is sub-10ms.

---

### 🔹 5. Aurora Global Database
**Q:** What is an Aurora Global Database and its primary use case?

**Answer:**
- **Global DB:** One primary region (read/write) and up to **5 secondary regions** (read-only).
- **Replication:** Cross-region replication lag is typically less than 1 second.
- **Use Case:** Disaster Recovery (RTO < 1 min) and reducing latency for global users.

---

### 🔹 6. Aurora Serverless
**Q:** When should you use Aurora Serverless?

**Answer:**
- For applications with **unpredictable or infrequent workloads**.
- **Scaling:** Automatically starts up, shuts down, and scales capacity based on application demand.
- **Pricing:** You pay per second based on Aurora Capacity Units (ACUs).

---

### 🔹 7. Aurora Database Cloning
**Q:** What is Aurora Database Cloning and why is it efficient?

**Answer:**
- **Cloning:** Creates a new cluster from an existing one using a **Copy-on-Write** protocol.
- **Efficiency:** Initially, the clone shares the same data volume as the original, making it extremely fast to create and cost-effective. Storage is only allocated as changes are made.

---

### 🔹 8. Aurora Machine Learning
**Q:** How does Aurora integrate with Machine Learning?

**Answer:**
- Allows you to perform ML-based predictions (via SageMaker or Comprehend) directly through **SQL queries**.
- **Use Cases:** Fraud detection, sentiment analysis, and product recommendations.

---

### 🔹 9. RDS & Aurora Security: IAM Authentication
**Q:** What is IAM Database Authentication?

**Answer:**
- Allows you to connect to your RDS/Aurora instance using an **IAM Role** instead of a traditional database password.
- **Benefits:** Centralized credential management and no need to store DB passwords in application code.

---

### 🔹 10. RDS Proxy
**Q:** What is RDS Proxy and why is it used?

**Answer:**
- A fully managed, highly available database proxy that makes applications more scalable and resilient to database failures.
- **Benefit:** It pools and shares established database connections, which is critical for **Lambda functions** that create many short-lived connections.

---

### 🔹 11. ElastiCache Overview (Redis vs. Memcached)
**Q:** Compare ElastiCache Redis and Memcached.

**Answer:**
- **Redis:**
    - Multi-AZ with Auto-Failover.
    - Supports **Read Replicas**.
    - Supports advanced data types (Sets, Hashes, Lists) and **Persistence** (snapshots).
- **Memcached:**
    - Multi-node for data partitioning (sharding).
    - No High Availability (data is lost if a node fails).
    - No persistence.
    - Use Case: Simple object caching.

---

### 🔹 12. ElastiCache Strategies (Lazy Loading vs. Write Through)
**Q:** Compare Lazy Loading and Write-Through caching strategies.

**Answer:**
- **Lazy Loading:** Cache is updated only when there is a cache miss. Data can become stale but only requested data is cached.
- **Write-Through:** Data is updated in the cache whenever it is written to the database. Data is always fresh, but unused data might occupy cache space.

---

### 🔹 13. RDS & Aurora Backup Retention
**Q:** What is the retention period for RDS automated backups?

**Answer:**
- Configurable from **1 to 35 days**.
- Setting it to `0` disables automated backups.
- Manual snapshots can be retained indefinitely.

---

### 🔹 14. RDS Custom
**Q:** What is RDS Custom and for which engines is it available?

**Answer:**
- A managed database service that grants you **access to the underlying OS** and database customization.
- **Engines:** Available for Oracle and Microsoft SQL Server.

---

### 🔹 15. RDS Multi-AZ DB Cluster
**Q:** What is a Multi-AZ DB Cluster in RDS?

**Answer:**
- Consists of one primary and two readable standby instances across three AZs.
- **Benefit:** Provides lower failover latency (typically < 35s) and readable standbys (unlike a standard Multi-AZ instance where the standby is purely passive).
