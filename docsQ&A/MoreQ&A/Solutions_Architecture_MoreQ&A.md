# 🎤 AWS Certified Solutions Architect: Solutions Architecture More Q&A

---

### 🔹 1. Decoupling for Resilience (SQS)
**Q:** A company's web application is directly making API calls to a slow legacy processing system. This causes the web application to timeout during peak traffic. How should the solutions architect redesign this for better resilience?

**Answer:** 
Introduce an **Amazon SQS (Simple Queue Service)** queue between the web application and the processing system. The web application sends messages to the queue (producers), and the processing system reads from the queue (consumers) as its own pace. This **decouples** the two systems and prevents web timeouts.

---

### 🔹 2. Fan-Out Pattern with SNS and SQS
**Q:** A company needs to trigger multiple processes (e.g., sending an email and updating a database) whenever a new order is placed. What architecture should they use to handle this efficiently?

**Answer:** 
The **Fan-Out Pattern**. The application sends a single message to an **Amazon SNS (Simple Notification Service)** topic. Multiple SQS queues are subscribed to that SNS topic. Each queue is processed by a different microservice to handle the specific tasks (email, DB update).

---

### 🔹 3. Large Data Migration (Snowball Edge)
**Q:** A company needs to migrate 500 TB of on-premises data to Amazon S3. They have a slow internet connection (10 Mbps) and need the migration completed in under a month. What is the best strategy?

**Answer:** 
Use **AWS Snowball Edge**. Request multiple Snowball Edge devices from AWS, load the data onto them locally, and ship them back to AWS. This is significantly faster and more secure for large-scale data migrations than using a slow internet connection.

---

### 🔹 4. Selecting the Right Database for NoSQL
**Q:** A solutions architect is designing a high-traffic gaming leaderboard that requires sub-millisecond latency and the ability to scale to millions of concurrent users with simple key-value queries. Which database should they choose?

**Answer:** 
**Amazon DynamoDB**. It is a fully managed NoSQL database service that provides seamless scalability and consistent single-digit millisecond latency at any scale.

---

### 🔹 5. VPC Endpoint for Private Communication
**Q:** A fleet of EC2 instances in a private subnet needs to securely access an Amazon S3 bucket without using a NAT Gateway or the public internet. What feature should be implemented?

**Answer:** 
**VPC Endpoint for S3 (Gateway Endpoint)**. This allows the EC2 instances to communicate with S3 using a private network route within the AWS backbone, improving security and potentially reducing costs.

---

### 🔹 6. Caching for Global Content (CloudFront)
**Q:** A company has global users downloading static assets (images, CSS) from a single S3 bucket in `us-east-1`. Users in Australia are reporting very high latency. What should be implemented to improve performance?

**Answer:** 
**Amazon CloudFront**. By setting up a CloudFront distribution with the S3 bucket as the origin, content is cached at over 400+ **Edge Locations** around the world, ensuring users in Australia download the content from a local server.

---

### 🔹 7. Serverless for Event-Driven Processing
**Q:** A company wants to automatically resize images whenever they are uploaded to an S3 bucket. They want to avoid managing any servers for this task. What is the best solution?

**Answer:** 
Use **S3 Event Notifications** to trigger an **AWS Lambda** function. The Lambda function will contain the resizing logic and will only run (and be billed) when an image is uploaded.

---

### 🔹 8. Designing for Multi-AZ RDS Persistence
**Q:** A company is running a database on an EC2 instance with an EBS volume. They want to ensure that if an entire AZ fails, the database is automatically recovered without data loss. What is the simplest managed solution?

**Answer:** 
Migrate the database to **Amazon RDS with Multi-AZ** enabled. RDS will automatically manage synchronous replication to a standby instance and handle the DNS failover if the primary AZ fails.

---

### 🔹 9. Cost Optimization: S3 Intelligent-Tiering
**Q:** A company has millions of objects in an S3 bucket. They don't know the access patterns for most of these objects and want to minimize their storage costs automatically. Which S3 storage class should they use?

**Answer:** 
**S3 Intelligent-Tiering**. This storage class automatically moves data between a frequent access tier and an infrequent access tier (and even archive tiers) based on actual access patterns without any manual intervention or retrieval fees.

---

### 🔹 10. Direct Connect for Consistent Performance
**Q:** A company requires a consistent, dedicated network connection between their on-premises data center and AWS that does not traverse the public internet for security and performance reasons. What service provides this?

**Answer:** 
**AWS Direct Connect**. It establishes a dedicated network connection from your premises to AWS, providing more consistent network performance and lower latency than internet-based VPN connections.
