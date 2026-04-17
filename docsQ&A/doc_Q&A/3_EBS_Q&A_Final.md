# 🎤 AWS Solutions Architect: Exhaustive EBS & Storage Q&A

This guide covers every detail found in the EBS and storage sections of the preparation material.

---

### 🔹 Section 1: Storage Fundamentals (I/O & Performance)

**Q1: What is an I/O and how is it measured?**

**Answer:** 
An I/O is a single read/write request. Performance is often measured by the request size (small like 1KB or large like several MBs).

---

**Q2: What does IOPS stand for and why is it considered "meaningless" on its own?**

**Answer:** 
IOPS stands for I/O Operations Per Second. It is meaningless without a **latency** figure, as high IOPS with high latency results in poor application performance.

---

**Q3: How do you calculate Throughput (Bandwidth) if you know the IOPS and I/O request size?**

**Answer:** 
- **Formula:** `Throughput = IOPS * Average I/O Request Size`.
- **Example:** 1,000 IOPS with a 4 KB request size results in `1,000 * 4 KB = 4,000 KB/s` (~4 MB/s).

---

**Q4: What are the acceptable latency targets for HDD vs. SSD?**

**Answer:** 
- **HDD:** 10 to 20 ms is considered acceptable.
- **SSD:** Should stay between 1-3 ms, often seeing less than 1 ms.

---

### 🔹 Section 2: EBS Volume Basics

**Q5: What is an Amazon EBS Volume and how does it differ from a physical hard drive?**

**Answer:** 
- **Amazon EBS (Elastic Block Store):** A network-attached block-level storage volume that you can attach to an EC2 instance.
- **Difference:** Since it is a network drive (not physically attached to the hardware), it communicates with the instance over the network, which may introduce a small amount of latency.
- **Persistence:** Unlike an Instance Store, EBS data can persist even after the EC2 instance is terminated.

---

**Q6: What is the Free Tier allowance for EBS?**

**Answer:** 
30 GB of free EBS storage of type General Purpose (SSD) or Magnetic per month.

---

**Q7: Can an EBS volume be attached to multiple instances?**

**Answer:** 
Normally, it is mounted to one instance at a time (at the CCP level). However, certain types (**io1/io2**) support **Multi-Attach** within the same AZ.

---

**Q8: What is the scope of an EBS volume and how do you move it across Availability Zones or Regions?**

**Answer:** 
- **Scope:** EBS volumes are locked to a specific **Availability Zone (AZ)**. A volume in `us-east-1a` cannot be directly attached to an instance in `us-east-1b`.
- **Migration:** To move a volume, you must:
    1. Create a **Snapshot** of the volume.
    2. (Optional) Copy the snapshot to another Region.
    3. Re-create a new volume from that snapshot in the target AZ.

---

**Q9: Does EBS have provisioned capacity?**

**Answer:** 
Yes. You must specify the size (GB) and IOPS needed when creating it. You are billed for the **provisioned capacity**, regardless of how much data is actually stored.

---

### 🔹 Section 3: Delete on Termination & Snapshots

**Q10: Explain the "Delete on Termination" attribute defaults.**

**Answer:** 
- **Root Volume:** Deleted by default when the EC2 instance is terminated (attribute enabled).
- **Additional Volumes:** Preserved by default (attribute disabled).
- This behavior can be controlled via the AWS Console or CLI.

---

**Q11: Is it necessary to detach an EBS volume before taking a snapshot?**

**Answer:** 
No, it is not necessary to detach the volume, but it is **recommended** for data integrity to ensure no writes are pending.

---

**Q12: Compare EBS Snapshot Archive vs. Fast Snapshot Restore (FSR).**

**Answer:** 
- **EBS Snapshot Archive:** A tier 75% cheaper than standard storage for long-term retention. Restoration is slow, taking **24 to 72 hours**.
- **Fast Snapshot Restore (FSR):** Removes the latency of the first read (initialization) from a snapshot. It is very expensive but provides maximum performance immediately upon volume creation.

---

**Q13: What is the purpose of the Recycle Bin for EBS Snapshots?**

**Answer:** 
It allows you to set up **retention rules** to retain deleted snapshots, protecting against accidental deletion by allowing recovery for a specified period (1 day to 1 year).

---

### 🔹 Section 4: AMI (Amazon Machine Image)

**Q14: What is an AMI and what are its primary benefits?**

**Answer:** 
- **AMI:** A customization of an EC2 instance containing the OS, software, and configuration.
- **Benefits:**
    - **Faster boot time** (software is pre-packaged).
    - **Consistency** across multiple instances.
    - Built for a specific region but can be copied across regions.

---

**Q15: What are the three sources for launching an AMI?**

**Answer:** 
1. **Public AMI:** Provided by AWS (e.g., Amazon Linux 2).
2. **Your own AMI:** You make and maintain them yourself.
3. **AWS Marketplace AMI:** An AMI someone else made and potentially sells.

---

**Q16: What is the process for creating an AMI from an EC2 instance?**

**Answer:** 
1. Start and customize an EC2 instance.
2. **Stop the instance** (recommended for data integrity).
3. Build the AMI (this also automatically creates the underlying EBS snapshots).

---

**Q17: Can you launch an EC2 instance in one Region using an AMI created in another?**

**Answer:** 
- **No.** AMIs are built for a specific AWS Region and are unique to that Region.
- **Workaround:** You must **copy the AMI** to the target Region before using it to launch instances there.

---

### 🔹 Section 5: EBS Volume Types (SSD vs. HDD)

**Q18: What are the 6 types of EBS volumes available?**

**Answer:** 
gp2, gp3 (General Purpose SSD), io1, io2 Block Express (Provisioned IOPS SSD), st1 (Throughput Optimized HDD), and sc1 (Cold HDD).

---

**Q19: Which EBS volume types can be used as boot volumes?**

**Answer:** 
Only **SSD-backed** volumes (gp2, gp3, io1, io2) and Magnetic (Standard) can be used as boot volumes. HDD types (st1, sc1) cannot.

---

**Q20: Compare gp2 and gp3 performance characteristics.**

**Answer:** 
- **gp2:** Performance (IOPS) is tightly linked to volume size (3 IOPS per GB). To get more IOPS, you must increase the disk size.
- **gp3:** Provides a baseline of 3,000 IOPS and 125 MiB/s. Allows you to increase **IOPS and Throughput independently** of storage size.

---

**Q21: When should you choose Provisioned IOPS (io1/io2) over General Purpose?**

**Answer:** 
For critical business applications needing more than 16,000 IOPS or database workloads that are sensitive to storage performance consistency and low latency.

---

**Q22: What are the specific limits for io1 and io2 Block Express?**

**Answer:** 
- **io1:** Max 64,000 IOPS (for Nitro instances) or 32,000 (others).
- **io2 Block Express:** Provides sub-millisecond latency and max **256,000 IOPS** with an IOPS:GB ratio of 1,000:1.

---

**Q23: Compare Throughput Optimized HDD (st1) and Cold HDD (sc1) use cases.**

**Answer:** 
- **st1 (Throughput Optimized):** Best for Big Data, Data Warehouses, and Log Processing (Max 500 MiB/s).
- **sc1 (Cold HDD):** Lowest cost for infrequently accessed data where performance is not a priority (Max 250 MiB/s).

---

### 🔹 Section 6: Encryption & Multi-Attach

**Q24: What is protected when you enable EBS Encryption?**

**Answer:** 
- Data at rest inside the volume.
- All data in flight between the instance and the volume.
- All snapshots and all volumes created from those snapshots.
- Encryption/decryption is handled transparently using KMS (AES-256).

---

**Q25: How do you encrypt an existing unencrypted EBS volume?**

**Answer:** 
1. Create a **Snapshot** of the unencrypted volume.
2. **Copy the Snapshot** while selecting the "Encrypt" option.
3. Create a **new Volume** from the encrypted snapshot.
4. Attach the new encrypted volume to the instance.

---

**Q26: What is EBS Multi-Attach and which volume types support it?**

**Answer:** 
- **Multi-Attach:** Allows you to attach the same EBS volume to up to **16 EC2 instances** simultaneously within the **same AZ**.
- **Supported Types:** Only the **io1/io2** families.
- **Requirement:** Must use a **cluster-aware file system** (like GFS2) to manage concurrent writes.

---

### 🔹 Section 7: EC2 Instance Store

**Q27: What is EC2 Instance Store and how does it differ from EBS?**

**Answer:** 
- **Instance Store:** Storage physically attached to the host server.
- **Key Difference:** It is **ephemeral**. Data is lost if the instance is stopped or the hardware fails.
- **Benefit:** Provides much higher I/O performance (lower latency and higher IOPS) than network-attached EBS.

---

**Q28: When should you use Instance Store?**

**Answer:** 
For temporary storage such as buffers, caches, scratch data, or any workload where data is replicated across instances.

---

### 🔹 Section 8: Amazon EFS (Elastic File System)

**Q29: What is Amazon EFS and how does it scale?**

**Answer:** 
A managed network file system (NFS) that can be mounted on **thousands of EC2 instances** simultaneously across **multiple Availability Zones**. It scales automatically in both storage and performance.

---

**Q30: What are the OS and protocol requirements for EFS?**

**Answer:** 
- **Protocol:** Uses NFSv4.1.
- **OS:** Compatible with **Linux-based** instances only (POSIX compliant). Not compatible with Windows.

---

**Q31: Compare EFS Performance Modes.**

**Answer:** 
- **General Purpose (Default):** For latency-sensitive use cases like web servers and CMS.
- **Max I/O:** For highly parallelized workloads (Big Data, media processing) where higher latency is acceptable for maximum aggregate throughput.

---

**Q32: Compare EFS Throughput Modes.**

**Answer:** 
- **Elastic (Recommended):** Automatically scales throughput up or down based on workload.
- **Provisioned:** You set a fixed throughput regardless of storage size.
- **Bursting:** Throughput scales based on the amount of data stored.

---

**Q33: How do EFS Storage Classes and Lifecycle Management save costs?**

**Answer:** 
Lifecycle Management automatically moves files to **Infrequent Access (IA)** or **Archive** tiers if they haven't been accessed for a set period. This can save over **90% in storage costs**.

---

**Q34: What is EFS "One Zone" deployment?**

**Answer:** 
A lower-cost option that stores data in only one AZ. It is great for development or non-critical workloads but lacks the durability of the Multi-AZ standard tier.

---

### 🔹 Section 9: Strategic Comparisons

**Q35: What is the main difference in scope between EBS Multi-Attach and EFS?**

**Answer:** 
- **EBS Multi-Attach:** Limited to multiple instances within a **single Availability Zone**.
- **Amazon EFS:** Can be accessed by instances across **multiple Availability Zones** within a Region.

---

**Q36: How do connection limits differ between EBS Multi-Attach and EFS?**

**Answer:** 
- **EBS Multi-Attach:** Supports a maximum of **16 instances**.
- **EFS:** Supports **thousands of concurrent connections**.

---

**Q37: When should you use EBS vs. EFS for a WordPress application?**

**Answer:** 
- **EBS:** Use for a single-instance WordPress site (data stored on a single disk).
- **EFS:** Use for a distributed/multi-instance WordPress setup to share image uploads and site files across all web servers.

---

**Q40: Which storage mechanism is best for a high-performance database requiring 300,000 IOPS?**

**Answer:** 
**EC2 Instance Store**. (EBS io2 Block Express maxes out at 256,000 IOPS).

---

**Q39: How is billing different between EBS and EFS?**

**Answer:** 
- **EBS:** Billed based on **provisioned capacity** (you pay for the size you allocate).
- **EFS:** Billed based on **actual usage** (pay-per-use for data stored).

---

**Q40: How do you handle EBS backups while an application is busy?**

**Answer:** 
EBS backups (snapshots) use I/O. It is recommended to **not run them while the application is handling peak traffic** to avoid performance degradation.
