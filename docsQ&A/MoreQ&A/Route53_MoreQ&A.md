# 🎤 AWS Certified Solutions Architect: Route 53 More Q&A

---

### 🔹 1. Latency-Based Routing Policy
**Q:** A company has global users and wants to ensure that each user is directed to the AWS Region that provides the best possible performance (lowest network latency). Which Route 53 routing policy should they choose?

**Answer:** 
**Latency Routing Policy**. This policy directs traffic to the AWS region that provides the lowest network latency for the user, regardless of their physical location.

---

### 🔹 2. Alias Records for Zone Apex
**Q:** A company needs to point their root domain (`example.com`) to an Application Load Balancer. Why is an Alias record better than a CNAME record for this requirement?

**Answer:** 
A **CNAME record** cannot be used for the root domain (**Zone Apex**). An **Alias record** is an AWS-specific extension that allows you to point a root domain to an AWS resource (like an ALB or S3 website) while maintaining DNS performance and being cost-free.

---

### 🔹 3. Geoproximity with Traffic Bias
**Q:** A company wants to route traffic to their resources based on geographic location but needs the ability to "shift" more traffic from a smaller region into a larger region's resources using a "bias" value. Which routing policy should they use?

**Answer:** 
**Geoproximity Routing Policy**. This policy allows you to expand or shrink the size of the geographic region from which Route 53 routes traffic to a resource by specifying a positive or negative **Bias** value.

---

### 🔹 4. Multi-Value Answer for Basic Load Balancing
**Q:** A company wants a simple way to return up to 8 healthy records for a single DNS query to provide basic client-side load balancing. Which routing policy should they implement?

**Answer:** 
**Multi-Value Answer Routing Policy**. Unlike simple routing, multi-value routing supports health checks and only returns records for healthy resources. It's a lightweight alternative to an ELB for certain use cases.

---

### 🔹 5. Private Hosted Zones for Internal DNS
**Q:** A company wants their internal applications within a VPC to resolve hostnames like `db.internal` to private IP addresses. They also need to ensure these records are not visible to the public internet. What feature of Route 53 should they use?

**Answer:** 
**Route 53 Private Hosted Zone**. You create a hosted zone for your internal domain and associate it with one or more specific VPCs. The DNS records within this zone are only resolvable by resources within those VPCs.

---

### 🔹 6. Route 53 Resolver for Hybrid Cloud
**Q:** A company has an on-premises data center and several AWS VPCs. They want their on-premises servers to be able to resolve DNS names for resources inside the VPCs and vice versa. What feature provides this integration?

**Answer:** 
**Route 53 Resolver (Inbound and Outbound Endpoints)**. Inbound endpoints allow on-premises systems to query Route 53, while Outbound endpoints allow Route 53 to forward queries for on-premises domains to your local DNS servers.

---

### 🔹 7. Active-Passive Failover Configuration
**Q:** A solutions architect is designing a Disaster Recovery (DR) plan where traffic is routed to a secondary region only if the primary region's application health check fails. Which routing policy should be configured?

**Answer:** 
**Failover Routing Policy**. You configure one record as **Primary** and another as **Secondary**. Route 53 monitors the health of the primary; if it's unhealthy, all traffic is redirected to the secondary.

---

### 🔹 8. Geolocation Routing for Compliance
**Q:** A media company has a legal requirement to restrict access to their content so that users in France see one version of the site and users everywhere else see a "default" version. Which routing policy helps with this?

**Answer:** 
**Geolocation Routing Policy**. This policy directs traffic based on the actual geographic location of the user (by country or continent), allowing you to customize the response for specific regions and maintain compliance.

---

### 🔹 9. Route 53 Health Checks for External Endpoints
**Q:** A company wants Route 53 to stop routing traffic to a legacy on-premises server if its web service becomes unavailable. Can Route 53 health checks monitor non-AWS resources?

**Answer:** 
**Yes**. Route 53 health checks can monitor any endpoint reachable over the public internet by IP address or domain name. If the endpoint fails the health check, Route 53 will consider that record unhealthy.

---

### 🔹 10. Route 53 TTL for Fast Propagation
**Q:** A company is planning a major migration and needs to ensure that they can quickly update their DNS records and have the changes propagate to users in under a minute. What should they do to the record settings?

**Answer:** 
Reduce the **TTL (Time To Live)** of the DNS records (e.g., to 60 seconds) well before the migration starts. This ensures that DNS resolvers around the world will cache the old record for only a short period and fetch the new record quickly after it's updated.
