# 🎤 AWS Certified Solutions Architect: Amazon Route 53 Q&A

---

### 🔹 1. Route 53 Basics
**Q:** What is Amazon Route 53 and its primary function?

**Answer:**
- **Route 53:** A highly available and scalable Domain Name System (DNS) web service.
- **Primary Function:** To translate human-readable names like `example.com` into numeric IP addresses like `192.0.2.1`.

---

### 🔹 2. DNS Record Types: A, CNAME, and Alias
**Q:** What is the difference between an A record, a CNAME record, and an Alias record?

**Answer:**
- **A Record:** Maps a hostname directly to an IPv4 address.
- **CNAME (Canonical Name):** Maps a hostname to another hostname. It can only be used for non-root domains (e.g., `www.example.com`).
- **Alias Record:** An AWS-specific extension that maps a hostname to an AWS resource (e.g., an ALB). It works for **both** root (`example.com`) and non-root domains.
- **Key Advantage:** Alias records are free and automatically update if the underlying resource's IP address changes.

---

### 🔹 3. Time To Live (TTL)
**Q:** What is TTL in DNS and what are the trade-offs of setting it high vs. low?

**Answer:**
- **TTL:** The amount of time a DNS resolver caches a record.
- **High TTL (e.g., 24h):** Fewer queries to Route 53 (lower cost), but changes to records take a long time to propagate.
- **Low TTL (e.g., 60s):** Fast propagation of changes, but results in more frequent queries (higher cost).

---

### 🔹 4. Public vs. Private Hosted Zones
**Q:** What is the difference between a Public and a Private Hosted Zone?

**Answer:**
- **Public Hosted Zone:** Stores DNS records for a domain that is accessible on the internet.
- **Private Hosted Zone:** Stores DNS records for a domain within one or more **VPCs**. These records are only visible to resources within those VPCs and are not accessible from the internet.

---

### 🔹 5. Routing Policy: Simple
**Q:** When should you use a Simple Routing Policy?

**Answer:**
- For a single resource that performs a given function for your domain (e.g., one web server).
- It can return multiple values (e.g., multiple IP addresses) in a random order, but it does not support health checks.

---

### 🔹 6. Routing Policy: Weighted
**Q:** How does a Weighted Routing Policy work?

**Answer:**
- Allows you to assign a relative "weight" to each record (e.g., 70% of traffic to Resource A and 30% to Resource B).
- **Use Cases:** Load balancing across regions and testing new software versions (canary deployments).

---

### 🔹 7. Routing Policy: Latency-Based
**Q:** What is the goal of Latency-Based Routing?

**Answer:**
- To route users to the AWS region that provides the **lowest network latency** (best response time).
- *Note:* It is based on network latency, not necessarily the closest geographical distance.

---

### 🔹 8. Routing Policy: Geolocation
**Q:** How does Geolocation Routing differ from Latency-Based Routing?

**Answer:**
- **Geolocation:** Based on the **actual location** of the user (Continent, Country, or US State).
- **Use Case:** Website localization (showing different languages) and restricting content distribution.

---

### 🔹 9. Routing Policy: Geoproximity
**Q:** What is Geoproximity Routing and the concept of "Bias"?

**Answer:**
- Routes traffic based on the geographic distance between your users and your resources.
- **Bias:** Allows you to expand or shrink the size of the geographic region from which Route 53 routes traffic to a resource.

---

### 🔹 10. Routing Policy: Failover (Active-Passive)
**Q:** How is a Failover Routing Policy configured?

**Answer:**
- You define a **Primary** record (Active) and a **Secondary** record (Passive/DR).
- Route 53 monitors the health of the Primary; if it fails, traffic is automatically routed to the Secondary.

---

### 🔹 11. Routing Policy: Multi-Value Answer
**Q:** What is a Multi-Value Answer Routing Policy?

**Answer:**
- Similar to Simple routing but it supports **Health Checks**.
- Route 53 returns up to 8 healthy records for each query. This is not a substitute for an ELB but provides basic client-side load balancing.

---

### 🔹 12. Route 53 Health Checks
**Q:** What are the three types of Route 53 Health Checks?

**Answer:**
1. **Endpoint Checks:** Monitor a public endpoint (IP or hostname).
2. **Calculated Checks:** Monitor the results of other health checks (up to 256).
3. **CloudWatch Alarm Checks:** Monitor a CloudWatch Alarm (useful for private resources within a VPC).

---

### 🔹 13. Health Checks: Text-Based Responses
**Q:** Can Route 53 Health Checks look for specific text in a response?

**Answer:**
- Yes. You can configure a health check to pass only if it finds a specific string in the first 5,120 bytes of the response body.

---

### 🔹 14. Domain Registrar vs. DNS Service
**Q:** Is a Domain Registrar the same as a DNS Service?

**Answer:**
- **No.** You can register a domain with one provider (e.g., GoDaddy) and use Route 53 as the DNS Service by updating the **NS (Name Server) records** at the registrar to point to Route 53.

---

### 🔹 15. Route 53 Resolver
**Q:** What is Route 53 Resolver?

**Answer:**
- A service that provides recursive DNS lookups for your VPC.
- **Resolver Endpoints:** Inbound and Outbound endpoints allow you to integrate your AWS DNS with your **on-premises DNS** infrastructure.
