
# Task 1 - Basic Network Scanning with Nmap

## Objective

Perform a basic network scan using Nmap to identify open ports, running services, service versions, and the operating system of a local/authorized machine. The scan results are documented and analyzed from a basic security perspective.

---

## Tools Used

* Nmap
* Kali Linux
* Linux Terminal
* VirtualBox

---

## What is Nmap?

Nmap (Network Mapper) is an open-source network scanning and security auditing tool. It can be used to discover hosts, identify open ports, detect running services and their versions, and perform operating system detection.

---

## Why Network Scanning Matters

Network scanning is important in cybersecurity because it helps security professionals understand what services are exposed on a system.

It can help identify:

* Open ports
* Running network services
* Service versions
* Possible attack surfaces
* Potentially unnecessary or insecure services

Security teams can use this information to reduce unnecessary exposure and improve system security.

---

## Environment

The scanning activity was performed in a controlled local environment using Kali Linux running inside VirtualBox.

The target used for testing was a local/authorized system.

---

## Nmap Installation

Nmap was already available on the Kali Linux system.

The installed version was verified using:

```bash
nmap --version
```

---

## 1. Basic Network Scan

### Command

```bash
nmap <target-ip>
```

### Purpose

The basic Nmap scan is used to identify open ports on the target system.

The scan provides an initial overview of the services that may be accessible on the target.

---

## 2. Service Version Detection

### Command

```bash
nmap -sV <target-ip>
```

### Purpose

The `-sV` option attempts to determine the service and version running on discovered open ports.

This information can help security professionals identify outdated or potentially vulnerable services.

---

## 3. Operating System Detection

### Command

```bash
sudo nmap -O <target-ip>
```

### Purpose

The `-O` option attempts to identify the operating system of the target system based on network responses and other characteristics.

---

## Scan Results

The detailed Nmap output is stored in:

```text
nmap_scan_results.txt
```

The main findings from the scan are documented below.

| Port            | Service     | Purpose     | Security Consideration |
| --------------- | ----------- | ----------- | ---------------------- |
| Add actual port | Add service | Add purpose | Add security analysis  |
| Add actual port | Add service | Add purpose | Add security analysis  |

> Update the table according to the actual ports and services identified during the Nmap scan.

---

## Security Analysis

Open ports represent network services that may be accessible to other systems. Every exposed service increases the potential attack surface.

For each discovered open port, the service should be checked to ensure that:

* The service is actually required.
* The service is properly configured.
* The software is regularly updated.
* Strong authentication is enabled where applicable.
* Unnecessary ports are closed.
* Sensitive services are not unnecessarily exposed.

An open port is not automatically a vulnerability. The associated service, configuration, software version, and network exposure must also be considered.

---

## Screenshots

Screenshots of the Nmap scans are included in the `screenshots` directory.

The screenshots demonstrate:

1. Basic Nmap scan
2. Service version detection
3. OS detection
4. Saved Nmap scan results

---

## Ethical Use

Nmap should only be used on systems that you own or have explicit permission to test.

Unauthorized network scanning can violate organizational policies, terms of service, or applicable laws.

This task was performed in a controlled lab/local environment for educational and cybersecurity learning purposes.

---

## Conclusion

This task demonstrated the basic use of Nmap for network reconnaissance and security assessment.

The scans helped identify open ports, running services, service versions, and attempted operating system detection. The results can be used by security professionals to understand the system's attack surface and identify services that may require additional security review.
