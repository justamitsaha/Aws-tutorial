# 🎤 AWS Certified Solutions Architect: EC2 More Q&A

---

### 🔹 1. Cost-Effective Batch Processing
**Q:** A company has a batch processing workload that is fault-tolerant and can be interrupted and resumed later. The workload runs for 2 hours every night. Which EC2 instance purchasing option is the MOST cost-effective for this scenario?

**Answer:** 
**Spot Instances**. Spot Instances offer the deepest discounts (up to 90%) for workloads that are fault-tolerant and can handle interruptions, making them ideal for non-critical batch processing.

---

### 🔹 2. High Availability for Web Applications
**Q:** A web application experiences sudden, unpredictable traffic spikes that cause it to become unresponsive. The company wants a solution that ensures high availability and automatically scales based on demand. What architecture should be recommended?

**Answer:** 
Use an **Auto Scaling Group (ASG)** distributed across multiple **Availability Zones (AZs)** behind an **Application Load Balancer (ALB)**. The ASG handles horizontal scaling, while the ALB performs health checks and routes traffic only to healthy instances.

---

### 🔹 3. Long-Term Predictable Workloads
**Q:** A company is running a database on an EC2 instance that will be required 24/7 for the next 12 months. Which purchasing option provides the best balance of cost savings and commitment?

**Answer:** 
**Reserved Instances (Standard or Convertible)** or a **Compute Savings Plan**. Both options offer significant discounts (up to 72%) in exchange for a 1-year or 3-year commitment to a specific instance type or a dollar amount of compute usage.

---

### 🔹 4. Dedicated Hardware for Compliance
**Q:** A company has a strict regulatory requirement that their workloads must run on physical servers that are not shared with any other customers. Additionally, they need to use their own per-socket software licenses (BYOL). Which EC2 option should they choose?

**Answer:** 
**Dedicated Hosts**. Unlike Dedicated Instances (which only guarantee dedicated hardware for the instance), Dedicated Hosts provide visibility and control over the physical server's sockets and cores, which is necessary for specific licensing requirements.

---

### 🔹 5. Performance for High-Throughput Networking
**Q:** A solutions architect is designing a high-performance computing (HPC) application that requires low-latency, high-bandwidth communication between EC2 instances. Which feature should be used?

**Answer:** 
**Elastic Fabric Adapter (EFA)**. EFA is a network interface for Amazon EC2 instances that enables customers to run applications requiring high levels of inter-node communications at scale on AWS.

---

### 🔹 6. Monitoring and Scaling Based on Memory
**Q:** By default, Amazon CloudWatch does not track memory utilization for EC2 instances. How can a company scale their Auto Scaling Group based on memory usage?

**Answer:** 
Install the **CloudWatch Agent** on the EC2 instances to collect and send memory metrics as **Custom Metrics** to CloudWatch. Then, create a Scaling Policy for the ASG that triggers based on these custom memory metrics.

---

### 🔹 7. Cross-Account Image Sharing
**Q:** A company needs to share a custom Amazon Machine Image (AMI) with a partner's AWS account for a joint project. What is the most secure way to achieve this?

**Answer:** 
Modify the **Permissions** of the AMI to grant access to the specific AWS Account ID of the partner. If the AMI is encrypted, you must also share the underlying **KMS Key** used for encryption with the partner account.

---

### 🔹 8. Instance Metadata Service (IMDS)
**Q:** An application running on EC2 needs to discover its own public IP address and instance ID. How can it retrieve this information without using the AWS CLI or SDK?

**Answer:** 
By querying the **Instance Metadata Service (IMDS)** at the link-local address: `http://169.254.169.254/latest/meta-data/`. This service provides various details about the instance itself.

---

### 🔹 9. Rapid Scaling for Flash Sales
**Q:** An e-commerce site anticipates a massive surge in traffic at exactly 12:00 AM for a flash sale. Standard dynamic scaling might be too slow to react. What is the best strategy?

**Answer:** 
Use **Scheduled Scaling** for the Auto Scaling Group. This allows you to set a "Desired Capacity" to a high value minutes before the event starts, ensuring instances are warmed up and ready to handle the load immediately.

---

### 🔹 10. Multi-AZ vs. Multi-Region Resilience
**Q:** A company requires its application to be resilient even if an entire AWS Region becomes unavailable. What architecture should they implement?

**Answer:** 
A **Multi-Region architecture**. This involves deploying the application in two or more regions and using **Route 53 Global Server Load Balancing (GSLB)** with a Failover or Latency routing policy to direct traffic between regions.
