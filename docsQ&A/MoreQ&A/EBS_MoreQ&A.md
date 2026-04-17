# 🎤 AWS Certified Solutions Architect: EBS More Q&A

---

### 🔹 1. High Performance with RAID
**Q:** A company needs to run a database that requires 50,000 IOPS, but the maximum IOPS for a single EBS volume (non-Block Express) is lower than this requirement. What is a common architectural pattern to achieve this?

**Answer:** 
Configure a **RAID 0 (Striping)** array across multiple EBS volumes. This combines the performance of several volumes to achieve higher aggregate throughput and IOPS than a single volume can provide.

---

### 🔹 2. Recovering Accidentally Deleted Snapshots
**Q:** A company wants to protect its Amazon EBS snapshots from accidental deletion by employees. They need a solution that allows them to recover deleted snapshots for up to 30 days. Which feature should be used?

**Answer:** 
**EBS Recycle Bin**. You can create a retention rule that automatically sends deleted EBS snapshots to the Recycle Bin and keeps them for a specified duration (e.g., 30 days) before they are permanently deleted.

---

### 🔹 3. Cost Optimization for Performance
**Q:** A company has a general-purpose workload that needs a baseline of 10,000 IOPS and a fixed throughput of 500 MiB/s. Which EBS volume type is the most cost-effective while allowing these metrics to be configured independently?

**Answer:** 
**gp3 (General Purpose SSD)**. Unlike gp2, which scales performance with storage size, gp3 allows you to provision IOPS and throughput independently of the storage capacity, providing more flexibility and cost-control.

---

### 🔹 4. Snapshot Data Lifecycle Management
**Q:** A solutions architect needs to ensure that EBS snapshots are taken every 24 hours and that snapshots older than 30 days are automatically deleted. What service should be used to automate this?

**Answer:** 
**Amazon Data Lifecycle Manager (Amazon DLM)**. DLM provides a simple, automated way to manage the lifecycle of EBS snapshots and EBS-backed AMIs.

---

### 🔹 5. EBS Multi-Attach Requirements
**Q:** A company wants to use EBS Multi-Attach to share a single EBS volume across multiple EC2 instances in the same AZ. Which specific volume types support this, and what is a critical software requirement for the application?

**Answer:** 
Only **io1** and **io2** volumes support Multi-Attach. The application must use a **cluster-aware file system** (like GFS2 or OCFS2) to manage concurrent write operations and prevent data corruption.

---

### 🔹 6. Impact of Snapshots on Performance
**Q:** A company is taking a snapshot of a 10 TB EBS volume. They notice a slight performance degradation. What is the cause, and how should they mitigate this for future snapshots?

**Answer:** 
Snapshots are taken from the EBS volume and stored in S3. While snapshots are asynchronous, they can consume I/O resources. To mitigate this, perform snapshots during **off-peak hours** or use **EBS-optimized instances** to provide dedicated bandwidth for EBS traffic.

---

### 🔹 7. Snapshot Across Accounts and Regions
**Q:** A company needs to disaster-recover their EBS volumes into a different AWS account and a different region. What steps should they take?

**Answer:** 
1. Create a **Snapshot** of the volume.
2. Modify the snapshot permissions to share it with the **Target Account ID**.
3. In the Target Account/Region, **Copy** the shared snapshot to the local region.
4. Re-create the **EBS Volume** from the copied snapshot.

---

### 🔹 8. Nitro System Performance
**Q:** A company is using Amazon EC2 Nitro-based instances. They need to achieve the absolute maximum performance for their block storage. Which specific EBS volume type should they choose?

**Answer:** 
**io2 Block Express**. When attached to Nitro instances, io2 Block Express volumes can provide up to 256,000 IOPS and 4,000 MB/s of throughput with sub-millisecond latency.

---

### 🔹 9. EBS Encryption and KMS
**Q:** An existing EBS volume is unencrypted. The security team mandates that all data at rest must be encrypted using a customer-managed KMS key. What is the process to encrypt this volume?

**Answer:** 
1. Create a **Snapshot** of the unencrypted volume.
2. **Copy** the snapshot, and in the copy settings, select **"Encrypt this snapshot"** using the specific KMS key.
3. Create a **new EBS volume** from the encrypted snapshot.
4. Replace the old volume with the new encrypted one.

---

### 🔹 10. Instance Store vs. EBS for High IOPS
**Q:** A solutions architect is designing a NoSQL database cluster that requires extremely high I/O (hundreds of thousands of IOPS) and can handle data replication at the application level. Which storage option provides the lowest latency?

**Answer:** 
**EC2 Instance Store (NVMe SSDs)**. Since these disks are physically attached to the host server, they offer the highest performance and lowest latency, though they are ephemeral and data is lost if the instance is stopped.
