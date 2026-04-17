# 🎤 AWS Certified Solutions Architect: HA & Scalability More Q&A

---

### 🔹 1. ALB vs. NLB for Static IPs
**Q:** A company's partner requires a list of specific, static IP addresses for the company's application to be whitelisted in their corporate firewall. Which load balancer should the company use to meet this requirement?

**Answer:** 
**Network Load Balancer (NLB)**. Unlike an Application Load Balancer (ALB), which has multiple, changing IP addresses, an NLB allows you to assign a **static Elastic IP address** to each Availability Zone where the NLB is enabled.

---

### 🔹 2. ASG Instance Protection and Termination
**Q:** An Auto Scaling Group is scaling in and terminating instances. The company wants to ensure that a specific EC2 instance, currently performing a long-running batch job, is not terminated during this process. What feature should they use?

**Answer:** 
**ASG Instance Scale-In Protection**. This setting allows you to protect individual instances from being terminated by an Auto Scaling Group's scale-in event.

---

### 🔹 3. Scaling Based on SQS Queue Length
**Q:** A batch processing application uses a pool of EC2 instances to process messages from an Amazon SQS queue. The workload varies throughout the day. How should the Auto Scaling Group be configured to scale based on the workload?

**Answer:** 
Create a **Target Tracking Scaling Policy** based on the custom metric: **"Backlog Per Instance"** (which is `ApproximateNumberOfMessagesVisible` / `Number of Instances in ASG`). This ensures the fleet size is proportional to the amount of work available in the queue.

---

### 🔹 4. Cross-Zone Load Balancing for Equal Distribution
**Q:** A company has an application distributed across 3 AZs. AZ-1 has 2 instances, AZ-2 has 2 instances, and AZ-3 has 6 instances. Traffic is being unevenly distributed. How can the company ensure that all 10 instances receive an equal number of requests?

**Answer:** 
**Enable Cross-Zone Load Balancing**. When enabled, the load balancer distributes incoming requests evenly across all registered instances in all enabled AZs, regardless of how many instances are in each individual zone.

---

### 🔹 5. ASG Lifecycle Hooks for Pre-Warmup
**Q:** A complex application takes 10 minutes to initialize after the EC2 instance is launched. The company wants to ensure that the instance is only added to the load balancer and starts receiving traffic after the initialization is complete. What is the best strategy?

**Answer:** 
Use **ASG Lifecycle Hooks**. You can create a "Pending:Wait" state during instance launch. The instance remains in this wait state while your script performs initialization, and the state transitions to "Pending:Proceed" only after a success signal is sent back to the ASG.

---

### 🔹 6. Load Balancer Path-Based Routing
**Q:** A company has a monolithic application that they are breaking into microservices. They want to route traffic for `example.com/api` to one target group and `example.com/images` to another target group. Which load balancer provides this capability?

**Answer:** 
**Application Load Balancer (ALB)**. ALBs operate at Layer 7 and support **Path-Based Routing**, allowing you to create rules that direct traffic to different target groups based on the URL path in the HTTP request.

---

### 🔹 7. Scaling Policy with a "Warm-up" Period
**Q:** An Auto Scaling Group is scaling out too aggressively because the newly launched instances take time to handle the load, causing the alarm to remain active. How can this be resolved?

**Answer:** 
Configure a **Scaling Warm-up** (or instance warm-up) period. This tells the ASG to wait for a specified time after an instance starts before it begins contributing to the aggregated CloudWatch metrics used for scaling decisions.

---

### 🔹 8. ALB for Authentication (Cognito Integration)
**Q:** A company wants to offload user authentication for their web application from the backend code to the infrastructure. Which load balancer feature can handle this?

**Answer:** 
**ALB Authentication with Amazon Cognito**. You can configure an ALB listener rule to authenticate users through an Amazon Cognito User Pool before forwarding the request to the target group.

---

### 🔹 9. ASG Termination Policy for Cost Savings
**Q:** A company wants their Auto Scaling Group to always terminate the oldest instances first during a scale-in event. How can they achieve this?

**Answer:** 
Modify the **ASG Termination Policy**. You can select a policy such as **"OldestInstance"** or create a **Custom Termination Policy** (using a Lambda function) to specify exactly which instances should be removed first.

---

### 🔹 10. ELB Stickiness for Session State
**Q:** An application is not designed to share session state across servers. A user logs in and starts a session on Instance A, but their next request is sent to Instance B, causing them to be logged out. What is the immediate, non-architectural fix?

**Answer:** 
Enable **Sticky Sessions (Session Affinity)** on the Load Balancer's target group. This ensures that a client's requests are consistently routed to the same target instance for the duration of the session.
