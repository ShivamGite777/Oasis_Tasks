
# Task 7 – Vulnerability Scanning with Nikto

## Objective

Use Nikto to perform an automated vulnerability scan on a local web server, identify security issues, analyse their risks, and document recommended remediation steps.

## Tools Used

* **Nikto v2.6.1**
* **Apache Web Server**
* **Kali Linux**
* **Linux Terminal**

## Target

```text
Target: 127.0.0.1
Protocol: HTTP
Port: 80
```

The scan was performed against a locally hosted Apache web server.

---

## 1. Installing Nikto

Nikto was installed on Kali Linux using:

```bash
sudo apt update
sudo apt install nikto -y
```

The installed version was checked using:

```bash
nikto -Version
```

---

## 2. Basic Nikto Scan

The basic vulnerability scan was performed using:

```bash
nikto -h 127.0.0.1
```

Nikto was used to identify potentially insecure HTTP headers, server configuration issues, information disclosure, and other web-server weaknesses.

---

## 3. Save Scan Results

The scan results were saved to a text file using:

```bash
nikto -h 127.0.0.1 -o nikto_scan_results.txt
```

The output is stored in:

```text
nikto_scan_results.txt
```

---

## 4. Vulnerabilities / Issues Found

### Medium Severity

#### 1. Missing Content-Security-Policy (CSP) Header

**Issue:**
The Content-Security-Policy header is missing.

**Risk:**
A missing CSP can increase the impact of certain web attacks, including Cross-Site Scripting (XSS).

**Recommended Fix:**
Configure an appropriate Content-Security-Policy header on the web server according to the application's requirements.

---

#### 2. Apache Information Disclosure

**Issue:**
The Apache `mod_status` feature reveals server information.

**Risk:**
Attackers may obtain useful information about the web server and its configuration.

**Recommended Fix:**
Disable `mod_status` if it is not required, or restrict access to the Apache `server-status` page to trusted users or local addresses.

---

### Low Severity

#### 3. X-Content-Type-Options Header Missing

**Issue:**
The `X-Content-Type-Options` security header is not configured.

**Risk:**
Browsers may perform MIME-type sniffing, which can create additional security risks.

**Recommended Fix:**

```text
X-Content-Type-Options: nosniff
```

Configure this header on the web server.

---

#### 4. Strict-Transport-Security (HSTS) Header Missing

**Issue:**
The HSTS header is missing.

**Risk:**
When HTTPS is used, browsers are not instructed to always use secure HTTPS connections.

**Recommended Fix:**
For an HTTPS-enabled website, configure:

```text
Strict-Transport-Security: max-age=31536000
```

---

#### 5. Permissions-Policy Header Missing

**Issue:**
The Permissions-Policy header is not configured.

**Risk:**
Browser features may be available without explicit restrictions.

**Recommended Fix:**
Configure a suitable Permissions-Policy according to the application's requirements.

---

#### 6. Referrer-Policy Header Missing

**Issue:**
The Referrer-Policy header is missing.

**Risk:**
More URL or referrer information than necessary may potentially be exposed.

**Recommended Fix:**

```text
Referrer-Policy: strict-origin-when-cross-origin
```

---

#### 7. X-Frame-Options Header Issue

**Issue:**
Nikto reports that the X-Frame-Options header is deprecated.

**Risk:**
Clickjacking protection should preferably use modern Content-Security-Policy controls.

**Recommended Fix:**
Configure an appropriate CSP `frame-ancestors` directive.

---

### Informational

#### 8. HTTP Methods Detected

**Detected Methods:**

```text
GET
POST
OPTIONS
HEAD
```

**Issue:**
These HTTP methods are enabled on the web server.

**Risk:**
This is generally informational. Unnecessary HTTP methods may increase the server's attack surface.

**Recommended Fix:**
Allow only the HTTP methods required by the application.

---

## 5. Severity Summary

| Severity      | Findings                                                                           |
| ------------- | ---------------------------------------------------------------------------------- |
| High          | None found                                                                         |
| Medium        | Missing CSP Header, Apache `mod_status` Information Disclosure                     |
| Low           | X-Content-Type-Options, HSTS, Permissions-Policy, Referrer-Policy, X-Frame-Options |
| Informational | HTTP Methods Detected                                                              |

---

## 6. SSL Scan

The SSL scan command specified by the task was:

```bash
nikto -h 127.0.0.1 -ssl
```

The target web server was configured for **HTTP on port 80** and did not have HTTPS configured. Therefore, the SSL scan did not return SSL-specific findings.

The `-ssl` option is applicable when the target supports HTTPS/SSL.

---

## 7. What is Nikto?

Nikto is an open-source web server scanner used to identify potentially dangerous files, outdated software, insecure HTTP headers, server misconfigurations, and other known web-server issues.

Nikto is useful for security testing because it can quickly identify common weaknesses in web servers.

---

## 8. Nikto as a Noisy Scanner

Nikto is considered a **noisy scanner** because it sends many requests to the target web server while testing different files, configurations, headers, and known issues.

This activity can generate many entries in web-server logs and can be easily detected by security monitoring systems such as IDS or SIEM solutions.

Because of this, Nikto should only be used on systems where you have permission to perform security testing.

---

## 9. Nikto vs Nmap

| Feature                   | Nikto                             | Nmap                                |
| ------------------------- | --------------------------------- | ----------------------------------- |
| Main Purpose              | Web server vulnerability scanning | Network discovery and port scanning |
| Focus                     | Web servers and HTTP/HTTPS        | Hosts, ports and network services   |
| Finds Open Ports          | Limited                           | Yes                                 |
| Checks Web Headers        | Yes                               | Limited                             |
| Detects Web Server Issues | Yes                               | Limited                             |
| Service Version Detection | Some                              | Yes                                 |
| OS Detection              | No                                | Yes                                 |

**In short:** Nmap is mainly used to discover hosts, ports, services, and network information, while Nikto focuses specifically on identifying common security issues in web servers.

---

## 10. Screenshots

The following screenshots were taken during the task:

* `nikto-install.png` — Nikto installation/version
* `nikto-scan.png` — Basic Nikto scan
* `nikto-results.png` — Nikto scan results
* `nikto-ssl.png` — SSL scan attempt

---

## 11. Conclusion

Nikto was successfully installed and used to scan a locally hosted Apache web server.

The scan identified several security configuration issues, including missing security headers, Apache information disclosure, and enabled HTTP methods. The findings were categorised by severity and recommended remediation steps were documented.

This task demonstrates how automated web vulnerability scanning can help identify common security weaknesses in a web server.

## Ethical Use

Nikto should only be used against systems that you own or have explicit permission to test. Scanning external or production systems without authorization may be illegal or disruptive.
