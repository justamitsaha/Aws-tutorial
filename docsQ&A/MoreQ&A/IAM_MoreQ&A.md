# 🎤 AWS Certified Solutions Architect: IAM More Q&A

---

### 🔹 1. Least Privilege for EC2 to S3
**Q:** An application running on EC2 needs to upload logs to a specific Amazon S3 bucket. The security team mandates the solution must follow the principle of least privilege and avoid long-term credentials. What should be implemented?

**Answer:** 
Create an **IAM Role** with a policy allowing the `s3:PutObject` action on that specific S3 bucket and attach this role to the EC2 **Instance Profile**. This way, AWS automatically manages temporary credentials for the instance.

---

### 🔹 2. Governing Multi-Account Permissions
**Q:** A company uses AWS Organizations and wants to ensure that no IAM user in any of its member accounts can delete an S3 bucket, even if they have administrator privileges in their account. What is the most effective way to enforce this?

**Answer:** 
Create and apply a **Service Control Policy (SCP)** to the Root of the organization (or specific Organizational Units). The SCP should contain an explicit **"Deny"** for the `s3:DeleteBucket` action. SCPs act as a filter that restricts permissions across all accounts.

---

### 🔹 3. Fine-Grained Delegated Administration
**Q:** A central security team wants to allow developers to create their own IAM roles but wants to ensure these roles can only have specific permissions (e.g., they cannot grant themselves administrator access). What feature should be used?

**Answer:** 
**IAM Permission Boundaries**. This is an advanced feature that allows an administrator to set the maximum permissions that an identity-based policy can grant to an IAM entity.

---

### 🔹 4. Cross-Account Access Without Sharing Credentials
**Q:** A company in Account A needs to allow a developer in Account B to access an Amazon S3 bucket in Account A. How should the solutions architect configure this?

**Answer:** 
In Account A, create an **IAM Role** that defines Account B as a trusted **Principal** in its Trust Policy. Then, in Account B, grant the developer permission to perform the `sts:AssumeRole` action on the role in Account A.

---

### 🔹 5. Temporary Access for External Users (Federation)
**Q:** A company wants to allow its corporate employees to access the AWS Management Console using their existing Corporate Active Directory credentials (Single Sign-On). Which service should be used?

**Answer:** 
**AWS IAM Identity Center (Successor to AWS Single Sign-On)**. This service allows you to link your external identity provider (via SAML 2.0) to AWS and manage all employee permissions centrally.

---

### 🔹 6. Analyzing Overly Permissive Policies
**Q:** A security auditor discovers an IAM user with a policy that allows `*` (AdministratorAccess) on all resources. They want to know which services this user has *actually* used in the last 90 days. Which IAM feature provides this information?

**Answer:** 
**IAM Access Advisor**. This tool provides a report on the "Service Last Accessed" data, allowing you to identify unused permissions and refine your policies according to the principle of least privilege.

---

### 🔹 7. Protecting the Root User
**Q:** A solutions architect is setting up a new AWS account. What is the very first security step they should take regarding the root user?

**Answer:** 
**Enable Multi-Factor Authentication (MFA)** on the root account. Additionally, create an IAM user with administrator permissions for daily management tasks and stop using the root user entirely.

---

### 🔹 8. Tag-Based Access Control
**Q:** A company wants to allow developers to stop and start only those EC2 instances that have a specific tag `Project: Apollo`. How can this be enforced in an IAM policy?

**Answer:** 
By using a **Condition** element in the IAM policy that checks for the resource tag: `"Condition": {"StringEquals": {"aws:ResourceTag/Project": "Apollo"}}`.

---

### 🔹 9. Temporary Credentials for Web/Mobile Apps
**Q:** A mobile application needs to access Amazon DynamoDB to save user scores. The company wants to avoid embedding AWS credentials in the application code. Which service should they use?

**Answer:** 
**Amazon Cognito Identity Pools**. This service allows you to exchange external identity provider tokens (like Google, Facebook, or Amazon) for temporary, limited-privilege AWS credentials.

---

### 🔹 10. IAM Policy Simulator
**Q:** A developer has written a complex IAM policy and wants to test if it will correctly allow or deny a specific set of API calls before applying it to a user. Which tool should they use?

**Answer:** 
The **IAM Policy Simulator**. This is a web-based tool provided by AWS to test and troubleshoot identity-based and resource-based policies without actually making any changes to your account.
