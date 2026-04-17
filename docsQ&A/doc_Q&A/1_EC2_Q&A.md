# 🎤 AWS Certified Solutions Architect: EC2 Q&A

---

### 🔹 1. EC2 Basics
**Q:** What is Amazon EC2 and what are its primary components?

**Answer:**
- **EC2 (Elastic Compute Cloud):** A core AWS service providing Infrastructure as a Service (IaaS).
- **Primary Components:**
    - Virtual machines (Instances).
    - Storing data on virtual drives (EBS).
    - Distributing loads (ELB).
    - Scaling services using Auto Scaling Groups (ASG).

---

### 🔹 2. EC2 User Data
**Q:** What is EC2 User Data and when is it executed?

**Answer:**
- **EC2 User Data:** A script used to bootstrap an instance by launching commands when the machine starts.
- **Execution:** It runs **only once** at the first start of the instance.
- **Common Tasks:** Installing updates, installing software, and downloading common files.

---

### 🔹 3. EC2 Instance Naming Convention
**Q:** Explain the EC2 naming convention using `m5.2xlarge` as an example.

**Answer:**
- **m:** The instance class (e.g., General Purpose).
- **5:** The generation (AWS improves these over time).
- **2xlarge:** The size within the instance class.

---

### 🔹 4. Instance Type Categories
**Q:** Compare General Purpose, Compute Optimized, and Memory Optimized instances.

**Answer:**
- **General Purpose (M or T):** Balanced compute, memory, and networking. Great for web servers and code repositories.
- **Compute Optimized (C):** High-performance processors for compute-intensive tasks like batch processing, media transcoding, and HPC.
- **Memory Optimized (R):** Fast performance for processing large data sets in memory, ideal for high-performance databases (relational/non-relational) and distributed caches.
- **Storage Optimized (I, G, H):** High, sequential read/write access to large data sets on local storage, great for OLTP systems and data warehousing.

---

### 🔹 5. EC2 Purchasing Options: Overview
**Q:** What are the different purchasing options for EC2 instances?

**Answer:**
- **On-Demand:** Short-term, unpredictable workloads; pay by the second/hour.
- **Reserved Instances:** 1 or 3-year commitment; up to 72% discount.
- **Savings Plans:** Commit to a dollar amount of usage per hour for 1 or 3 years.
- **Spot Instances:** Short workloads; up to 90% discount; can be interrupted if price exceeds maximum.
- **Dedicated Hosts:** Reserve a full physical server; control instance placement.
- **Capacity Reservations:** Reserve capacity in a specific AZ for any duration.

---

### 🔹 6. Dedicated Instances vs. Dedicated Hosts
**Q:** What is the main difference between Dedicated Instances and Dedicated Hosts?

**Answer:**
- **Dedicated Instances:** Instances run on hardware dedicated to a single customer. You don't share the physical server, but AWS manages the placement.
- **Dedicated Hosts:** You have a physical server dedicated for your use. This gives you **visibility and control** over sockets and physical cores, which is essential for Bring Your Own License (BYOL) scenarios.

---

### 🔹 7. EC2 Spot Instances & Interruption
**Q:** How does AWS handle Spot Instance interruptions?

**Answer:**
- If the spot price exceeds your maximum price, you receive a **2-minute warning** before the instance is interrupted.
- **Options:** You can choose to **stop** (preserve EBS data) or **terminate** the instance.

---

### 🔹 8. EC2 Hibernate
**Q:** How does the EC2 Hibernate feature work?

**Answer:**
- **Mechanism:** The contents of the RAM (memory) are saved to the **encrypted EBS root volume**.
- **Resume:** Upon restart, the RAM state is restored from EBS, allowing applications to resume exactly where they left off.
- **Use Case:** Long-running processes or applications that take a long time to warm up (e.g., loading caches).

---

### 🔹 9. Public vs. Private IPv4 Addresses
**Q:** What is the difference between a Public IP and a Private IP in the context of EC2?

**Answer:**
- **Public IP:** Unique across the entire web; used to identify the machine on the internet. It can change if the instance is stopped/restarted (unless it's an Elastic IP).
- **Private IP:** Identifies the machine within a private network (AWS internal). It remains the same even if the instance is stopped/restarted.

---

### 🔹 10. EC2 Placement Groups
**Q:** Compare Cluster, Spread, and Partition placement groups.

**Answer:**
- **Cluster:** Places instances close together in a **single AZ** for low latency and high network throughput.
- **Spread:** Places instances on **distinct hardware** (racks) to minimize simultaneous failure; can span multiple AZs.
- **Partition:** Divides groups into partitions; each partition has its own rack. Great for distributed workloads like Hadoop or Kafka.

---

### 🔹 11. Security Groups (Firewalls)
**Q:** What are the core characteristics of EC2 Security Groups?

**Answer:**
- They act as a "firewall" at the **instance level**, not the subnet level.
- **Default Behavior:** All inbound traffic is **blocked** by default; all outbound traffic is **authorized** by default.
- **Rules:** Can reference IP ranges or other Security Groups.

---

### 🔹 12. Elastic Network Interface (ENI)
**Q:** What is an ENI and what does it represent?

**Answer:**
- **ENI:** A virtual network interface that can be attached to an instance.
- **Attributes:** Includes a primary private IPv4, one or more secondary IPs, a MAC address, and security group associations.
- **Persistence:** You can detach a secondary ENI and attach it to another instance for failover.

---

### 🔹 13. High-Performance Computing (HPC)
**Q:** Which EC2 instance type is best for HPC?

**Answer:**
- **Compute Optimized (C class):** Designed for workloads requiring high-performance processors and high-performance computing.

---

### 🔹 14. Troubleshooting Connection Timeout
**Q:** If an application on EC2 times out, what is the most likely cause?

**Answer:**
- It is almost certainly a **Security Group issue** (e.g., the required port is not open in the inbound rules).
- *Note:* A "Connection Refused" error usually means the application is not running or has an internal error.

---

### 🔹 15. EC2 Purchasing: Spot Fleets
**Q:** What is a Spot Fleet?

**Answer:**
- A service that automatically manages a group of Spot Instances (and optionally On-Demand) to meet a target capacity.
- It chooses the best combination of instance types and AZs based on price and availability strategies (Lowest Price vs. Capacity Optimized).
