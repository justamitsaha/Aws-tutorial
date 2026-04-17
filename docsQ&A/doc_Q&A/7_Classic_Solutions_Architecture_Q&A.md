# 🎤 AWS Certified Solutions Architect: Classic Solutions Architecture Q&A

---

### 🔹 1. Stateless Web App: WhatIsTheTime.com
**Q:** How do you design a simple stateless web application that needs to scale?

**Answer:**
- **Initial:** Single EC2 instance with a Public IP and Route 53 A record.
- **Scaling:**
    - **Vertical:** Increase instance size (T2 to M5).
    - **Horizontal:** Use an **Auto Scaling Group (ASG)** and an **Application Load Balancer (ALB)**.
- **Redundancy:** Spread instances across **multiple AZs** to ensure high availability.

---

### 🔹 2. Stateful Web App: MyClothes.com
**Q:** How do you handle user shopping carts in a horizontally scaled web application?

**Answer:**
- **Option 1: Stickiness (Session Affinity):** Use ELB stickiness to send the same user to the same instance. (Drawback: Instance failure means data loss).
- **Option 2: User Cookies:** Store cart data in the browser's cookies. (Drawback: Limited size and security risks).
- **Option 3: Server-Side Session (Recommended):** Store session data in a central, high-performance store like **ElastiCache (Redis)**. This keeps the web servers **stateless**.

---

### 🔹 3. Database Scaling for Read-Heavy Apps
**Q:** What are the strategies for scaling a read-heavy application like a news site?

**Answer:**
- **RDS Read Replicas:** Create multiple read replicas to offload read traffic from the primary DB.
- **Caching (ElastiCache):** Cache the most frequent queries to reduce the load on the database entirely.

---

### 🔹 4. Multi-Tier Architecture Security
**Q:** How should Security Groups be configured for a 3-tier architecture?

**Answer:**
- **Web Tier:** Allow HTTP/HTTPS from the internet (0.0.0.0/0).
- **App Tier:** Allow traffic **only from the Web Tier Security Group**.
- **DB Tier:** Allow traffic **only from the App Tier Security Group**.
- *Rule of Thumb:* Never open your DB or App tier directly to the internet.

---

### 🔹 5. Fully Scalable WordPress: MyWordPress.com
**Q:** What is the ideal architecture for a scalable, multi-AZ WordPress site?

**Answer:**
- **DB Layer:** Use **Amazon Aurora** (MySQL) for easy Multi-AZ and Read Replicas.
- **Storage Layer:** Use **Amazon EFS** to store image uploads. EFS can be mounted on all EC2 instances across all AZs simultaneously.
- **Compute Layer:** ASG with instances across multiple AZs.
- **Entry Layer:** ALB with an SSL certificate.

---

### 🔹 6. Instantiating Applications Quickly
**Q:** Compare Golden AMIs vs. User Data for launching applications.

**Answer:**
- **Golden AMI:** Pre-install all OS dependencies and applications. Result: Very fast boot time but needs updates whenever the software changes.
- **User Data:** A script that installs everything at boot. Result: Slow boot time but very flexible and dynamic.
- **Hybrid Approach:** Use a Golden AMI for the core OS/dependencies and User Data for the final, dynamic configuration.

---

### 🔹 7. Elastic Beanstalk Overview
**Q:** What is AWS Elastic Beanstalk and why is it useful for developers?

**Answer:**
- **Beanstalk:** A managed service that handles the deployment, capacity provisioning, load balancing, and auto-scaling of web applications.
- **Benefit:** Developers only need to provide the **application code**. AWS manages the underlying infrastructure (EC2, ASG, RDS, etc.).

---

### 🔹 8. Disaster Recovery: RTO vs. RPO
**Q:** What are RTO and RPO in the context of DR?

**Answer:**
- **RTO (Recovery Time Objective):** How long it takes to restore the application after a failure (Target = as low as possible).
- **RPO (Recovery Point Objective):** How much data you can afford to lose (e.g., "We can afford to lose 1 hour of data").

---

### 🔹 9. Route 53: Alias vs. CNAME for ELB
**Q:** Should you use an Alias record or a CNAME for your load balancer in Route 53?

**Answer:**
- **Alias Record:** Always preferred for AWS resources. It supports the "Zone Apex" (root domain) and is free.
- **CNAME:** Cannot be used for the root domain.

---

### 🔹 10. Multi-AZ vs. Multi-Region
**Q:** When should you choose Multi-Region over Multi-AZ?

**Answer:**
- **Multi-AZ:** To protect against the failure of a single data center (standard High Availability).
- **Multi-Region:** To protect against a total region failure or to provide **lower latency** to global users.
