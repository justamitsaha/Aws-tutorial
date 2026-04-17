# 🎤 AWS Certified Solutions Architect: HA & Scalability Q&A

---

### 🔹 1. Vertical vs. Horizontal Scalability
**Q:** What is the difference between Vertical and Horizontal scaling?

**Answer:**
- **Vertical Scaling (Scaling UP):** Increasing the size/power of an existing instance (e.g., from `t2.micro` to `m5.large`). Good for non-distributed systems but has a hardware limit.
- **Horizontal Scaling (Scaling OUT):** Increasing the **number** of instances. This is common for distributed systems and is often facilitated by Auto Scaling Groups.

---

### 🔹 2. High Availability (HA)
**Q:** What is High Availability and how is it achieved in AWS?

**Answer:**
- **HA:** Ensuring a system remains operational even if some of its components fail.
- **Achievement:** By running instances for the same application across **multiple Availability Zones (AZs)**. If one AZ goes down, the instances in the other AZ(s) continue to serve traffic.

---

### 🔹 3. Elastic Load Balancer (ELB) Overview
**Q:** What are the three main types of Load Balancers in AWS?

**Answer:**
- **Application Load Balancer (ALB):** Operates at Layer 7 (HTTP/HTTPS). Ideal for microservices and container-based apps.
- **Network Load Balancer (NLB):** Operates at Layer 4 (TCP/UDP/TLS). Used for ultra-high performance and static IP requirements.
- **Gateway Load Balancer (GWLB):** Operates at Layer 3 (IP). Used for managing 3rd-party virtual appliances (e.g., firewalls, IDS/IPS).

---

### 🔹 4. ALB Routing Capabilities
**Q:** What are the advanced routing features of an Application Load Balancer?

**Answer:**
- Routing based on **Path** in the URL (`example.com/users` vs. `example.com/posts`).
- Routing based on **Hostname** (`one.example.com` vs. `two.example.com`).
- Routing based on **Query Strings** or **HTTP Headers**.

---

### 🔹 5. Target Groups in ELB
**Q:** What can be a target in an ALB Target Group?

**Answer:**
- EC2 Instances.
- ECS Tasks.
- Lambda Functions.
- Private IP Addresses.

---

### 🔹 6. ELB Health Checks
**Q:** How does a Load Balancer ensure it only sends traffic to healthy instances?

**Answer:**
- It performs regular **Health Checks** on a specific port and route (e.g., `/health`).
- If the response code is not `200 (OK)`, the instance is marked as unhealthy and the load balancer stops sending it traffic.

---

### 🔹 7. Cross-Zone Load Balancing
**Q:** What is Cross-Zone Load Balancing and which load balancers support it?

**Answer:**
- **Cross-Zone LB:** Distributes traffic evenly across all registered instances in **all AZs**, regardless of the number of instances in each AZ.
- **Support:**
    - **ALB:** Enabled by default.
    - **NLB/GWLB:** Disabled by default (you pay for inter-AZ data if enabled).
    - **CLB:** Disabled by default.

---

### 🔹 8. SSL/TLS and Server Name Indication (SNI)
**Q:** What is SNI and why is it important for modern Load Balancers?

**Answer:**
- **SNI:** A protocol that allows a client to specify the **hostname** they are trying to reach during the initial SSL handshake.
- **Importance:** Allows one load balancer (ALB or NLB) to serve **multiple SSL certificates** for multiple websites on a single listener.
- *Note:* SNI does not work for the older Classic Load Balancer (CLB).

---

### 🔹 9. Connection Draining (Deregistration Delay)
**Q:** What is Connection Draining and what is its purpose?

**Answer:**
- **Purpose:** To gracefully handle instances that are being de-registered or marked as unhealthy.
- **Action:** The load balancer stops sending new requests to the instance but allows existing "in-flight" requests to complete before fully removing the instance.
- **Timeout:** Configurable between 1 and 3600 seconds (default is 300s).

---

### 🔹 10. Auto Scaling Group (ASG) Goals
**Q:** What are the primary goals of an Auto Scaling Group?

**Answer:**
- **Scale Out:** Add instances to match increased load.
- **Scale In:** Remove instances to match decreased load.
- **Self-Healing:** Automatically replace unhealthy instances.
- **Maintenance:** Ensure a minimum/maximum number of instances are always running.

---

### 🔹 11. ASG Scaling Policies
**Q:** Compare Target Tracking, Simple, and Step Scaling policies.

**Answer:**
- **Target Tracking:** Easiest to setup. You set a target metric (e.g., "Keep average CPU at 40%").
- **Simple/Step Scaling:** Triggered by CloudWatch alarms (e.g., "Add 2 instances if CPU > 80%").
- **Scheduled Scaling:** Scale based on known usage patterns (e.g., "Scale out at 9 AM on Monday").

---

### 🔹 12. Predictive Scaling
**Q:** What is Predictive Scaling in ASG?

**Answer:**
- An AWS feature that uses **Machine Learning** to forecast future traffic and schedule scaling actions in advance. This helps ensure instances are ready *before* the traffic spike hits.

---

### 🔹 13. ASG Cooldown Period
**Q:** What is the ASG Cooldown Period?

**Answer:**
- A period of time (default 300s) after a scaling action during which the ASG will not launch or terminate additional instances. This prevents over-scaling or rapid "flapping" of instances.

---

### 🔹 14. Sticky Sessions (Session Affinity)
**Q:** When would you use Sticky Sessions on a Load Balancer?

**Answer:**
- When an application stores session data **locally** on an instance and you need to ensure the same client is always routed to the same instance.
- *Best Practice:* Use a distributed cache (like ElastiCache) instead of sticky sessions to maintain statelessness.

---

### 🔹 15. X-Forwarded-For Header
**Q:** How can an EC2 instance behind an ALB get the original client's IP address?

**Answer:**
- The ALB automatically adds the **`X-Forwarded-For`** HTTP header, which contains the client's public IP address.
- Other headers include `X-Forwarded-Proto` (protocol) and `X-Forwarded-Port` (port).
