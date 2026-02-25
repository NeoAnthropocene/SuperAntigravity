---
name: security-review
description: Use when reviewing code for vulnerabilities, implementing authentication or authorization, handling user input, storing sensitive data, or before any feature that touches security boundaries goes to production
---

# Security Review

## Overview

Security is not a feature — it's a property of the entire system.
Review security boundaries systematically, not ad-hoc.

## When to Use

- Authentication, authorization, session management code
- Any user input that touches storage, commands, or rendering
- Secrets, credentials, API keys in code or config
- Before a security-sensitive feature ships
- After any change to auth flows or data access controls

## OWASP Top 10 Checklist

Work through these for every security-relevant code change:

**A01 - Broken Access Control**
- [ ] Every endpoint checks authorization, not just authentication
- [ ] Users can only access their own data
- [ ] Admin functions require explicit admin role check

**A02 - Cryptographic Failures**
- [ ] No secrets in source code or env files committed to git
- [ ] Passwords hashed with bcrypt/argon2 (not MD5/SHA1)
- [ ] Data in transit uses TLS
- [ ] Sensitive data not logged

**A03 - Injection**
- [ ] All database queries use parameterized queries / ORM (never string concat)
- [ ] All shell commands use safe exec (never `eval` with user input)
- [ ] All HTML output is escaped or uses safe template engine

**A04 - Insecure Design**
- [ ] Authentication flows validated against known-good patterns
- [ ] Rate limiting on authentication endpoints
- [ ] Account enumeration prevented (same response for unknown user vs wrong password)

**A05 - Security Misconfiguration**
- [ ] Debug mode disabled in production
- [ ] Default credentials changed
- [ ] Unnecessary features/endpoints disabled
- [ ] Error messages don't expose stack traces to users

**A07 - Authentication Failures**
- [ ] Session tokens invalidated on logout
- [ ] Password reset tokens expire and are single-use
- [ ] Brute force protection on login

**A08 - Software and Data Integrity**
- [ ] Dependencies pinned to verified versions
- [ ] No eval() or dynamic code execution with user input

**A09 - Logging and Monitoring**
- [ ] Authentication events logged (success and failure)
- [ ] Sensitive operations audited
- [ ] Logs don't contain secrets or PII

## Common Vulnerabilities to Check

| Vulnerability | Check |
|---------------|-------|
| SQL Injection | All queries parameterized? |
| XSS | All user content escaped before rendering? |
| CSRF | State-changing requests have CSRF protection? |
| Path traversal | File paths sanitized and validated? |
| Secret exposure | No hardcoded keys/tokens in code? |
| Mass assignment | Only allowed fields accepted from user input? |

## Red Flags in Code

These patterns require immediate review:
- `eval()`, `exec()`, `system()` with any user-influenced input
- String concatenation in SQL: `"SELECT * FROM users WHERE id = " + userId`
- `innerHTML = userContent` (XSS)
- `require(userInput)` or dynamic imports with user data
- Secrets in `.env` files committed to git
- MD5 or SHA1 for password hashing

## Output

For each finding, document:
1. **Vulnerability type** (OWASP category)
2. **Severity** (Critical/High/Medium/Low)
3. **Location** (file:line)
4. **Description** (what's wrong and why)
5. **Fix** (specific code change or pattern to use)
