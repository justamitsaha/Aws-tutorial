# 🎤 AWS Certified Solutions Architect: IAM Q&A

---

### 🔹 1. IAM Overview
**Q:** What is IAM and what is its primary function?

**Answer:**
- **IAM (Identity and Access Management):** A global service that allows you to manage access to AWS services and resources securely.
- **Primary Function:** To control **who** (authentication) can do **what** (authorization) in your AWS account.

---

### 🔹 2. Root User Best Practices
**Q:** What is the AWS Root User and what are the best practices for using it?

**Answer:**
- **Root User:** The identity created when you first register for an AWS account. It has full, irrevocable access to all resources.
- **Best Practices:**
    - **Stop using it** for daily tasks.
    - Create individual IAM users for people and give them only the necessary permissions.
    - **Enable MFA** on the root account immediately.

---

### 🔹 3. IAM Users and Groups
**Q:** How do IAM Users and Groups work together?

**Answer:**
- **Users:** Represent individuals or applications.
- **Groups:** A collection of IAM users. Permissions assigned to a group are inherited by all users within that group.
- **Limitation:** Groups only contain users; they cannot contain other groups.

---

### 🔹 4. IAM Policies (JSON Structure)
**Q:** What are IAM Policies and what is their typical structure?

**Answer:**
- **Policies:** JSON documents that define permissions.
- **Structure:**
    - **Version:** Policy language version (e.g., "2012-10-17").
    - **Statement:** The core of the policy, containing:
        - **Effect:** Allow or Deny.
        - **Action:** List of API calls (e.g., `s3:ListBucket`).
        - **Resource:** List of resources to which the action applies (using ARNs).
        - **Condition:** (Optional) Circumstances under which the policy is in effect.

---

### 🔹 5. IAM Roles vs. Users
**Q:** What is the difference between an IAM User and an IAM Role?

**Answer:**
- **IAM User:** Has long-term credentials (password or access keys) and is intended for a single person or application.
- **IAM Role:** Does not have long-term credentials. Instead, it is **assumed** by a trusted entity (like an EC2 instance or a cross-account user) to gain temporary permissions.

---

### 🔹 6. Multi-Factor Authentication (MFA)
**Q:** Why is MFA critical in AWS?

**Answer:**
- MFA adds an extra layer of security beyond just a username and password.
- Even if a password is stolen, the account remains protected by the second factor (e.g., a virtual MFA app like Google Authenticator or a hardware device).

---

### 🔹 7. IAM Access Keys
**Q:** What are IAM Access Keys used for?

**Answer:**
- Used for programmatic access to AWS via the **AWS CLI** or **SDKs**.
- They consist of an **Access Key ID** (public) and a **Secret Access Key** (private).
- *Warning:* Never share secret access keys or commit them to code repositories.

---

### 🔹 8. IAM Policy Evaluation Logic
**Q:** How does AWS evaluate multiple IAM policies (e.g., User policy vs. Group policy)?

**Answer:**
- **Default:** Deny everything.
- **Explicit Deny:** Always takes precedence over any "Allow."
- **Allow:** If an explicit "Allow" exists and no explicit "Deny" is present, the action is permitted.

---

### 🔹 9. Cross-Account Access
**Q:** How can you grant a user in Account A access to resources in Account B?

**Answer:**
- Create an **IAM Role** in Account B.
- Define a **Trust Policy** on the role that allows Account A to assume it.
- Grant the user in Account A permission to perform the `sts:AssumeRole` action.

---

### 🔹 10. IAM Best Practices (Summary)
**Q:** What are the top 5 IAM best practices?

**Answer:**
1. **Least Privilege:** Grant only the minimum permissions required.
2. **MFA:** Enable MFA for all users, especially the root user.
3. **Use Groups:** Manage permissions via groups instead of individual users.
4. **Strong Password Policy:** Enforce complex passwords and regular rotation.
5. **Use IAM Roles:** Use roles for EC2 instances and cross-account access instead of hardcoded credentials.

---

### 🔹 11. Principal in IAM
**Q:** What is a "Principal" in the context of an IAM policy?

**Answer:**
- A Principal is the entity (user, account, service, or role) that is allowed or denied access to a resource.
- *Note:* In a **Resource-based policy** (like an S3 bucket policy), the Principal field is mandatory.

---

### 🔹 12. IAM Policy Types: Managed vs. Inline
**Q:** Compare AWS Managed Policies, Customer Managed Policies, and Inline Policies.

**Answer:**
- **AWS Managed:** Created and managed by AWS; can be attached to multiple users/groups.
- **Customer Managed:** Created by you; also reusable and supports versioning.
- **Inline:** Embedded directly into a single user, group, or role; not reusable.

---

### 🔹 13. IAM Credentials Report
**Q:** What is the IAM Credentials Report?

**Answer:**
- A report that lists all users in your account and the status of their various credentials (passwords, access keys, MFA status).
- Useful for auditing and security compliance.

---

### 🔹 14. IAM Access Advisor
**Q:** How does IAM Access Advisor help in implementing "Least Privilege"?

**Answer:**
- It shows the "service last accessed" data for a user or role.
- If a user has S3 permissions but hasn't used them in 90 days, you can safely remove them.

---

### 🔹 15. IAM Service Control Policies (SCPs)
**Q:** What are SCPs and how do they differ from IAM Policies?

**Answer:**
- **SCPs:** Part of **AWS Organizations**; they define the maximum available permissions for an entire AWS account or OU.
- **Difference:** SCPs don't grant permissions; they act as a filter that restricts what IAM policies within that account can actually do.
