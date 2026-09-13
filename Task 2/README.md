# Task 2 — Basic Firewall Configuration with UFW

## Objective

Set up and configure a basic firewall on a Linux system using **UFW (Uncomplicated Firewall)**. The firewall was configured to allow and deny specific types of network traffic.

## Tools Used

* Linux (Kali Linux)
* UFW (Uncomplicated Firewall)
* Terminal

---

## What is a Firewall?

A firewall is a security system that controls incoming and outgoing network traffic based on predefined rules.

It helps protect a computer from unauthorized network access by allowing trusted traffic and blocking unwanted traffic.

---

## UFW Installation

UFW was installed using:

```bash
sudo apt update
sudo apt install ufw -y
```

UFW stands for **Uncomplicated Firewall** and provides an easy way to manage firewall rules on Linux.

---

## Firewall Rules

The following rules were configured:

| Rule              | Purpose                      |
| ----------------- | ---------------------------- |
| Allow SSH (22)    | Allows SSH connections       |
| Deny HTTP (80)    | Blocks incoming HTTP traffic |
| Allow HTTPS (443) | Allows secure HTTPS traffic  |
| Deny FTP (21)     | Blocks incoming FTP traffic  |

### Commands Used

```bash
sudo ufw allow ssh
sudo ufw deny http
sudo ufw allow https
sudo ufw deny ftp
```

---

## Enable UFW

The firewall was enabled using:

```bash
sudo ufw enable
```

---

## Verify Firewall Rules

The active firewall configuration was checked using:

```bash
sudo ufw status verbose
```

The configured rules showed:

* SSH traffic allowed
* HTTP traffic denied
* HTTPS traffic allowed
* FTP traffic denied

---

## Testing Denied Traffic

To test port 80, the following command was used:

```bash
nc -zv 127.0.0.1 80
```

The connection returned:

```text
Connection refused
```

The UFW rules were also verified using:

```bash
sudo ufw status numbered
```

Port 80 was shown as:

```text
80/tcp    DENY IN
```

This confirms that incoming HTTP traffic on port 80 was configured to be denied by UFW.

> Note: `Connection refused` on localhost alone does not independently prove that UFW blocked the connection; it can also mean no service was listening on port 80. The UFW rule verification confirms that the deny rule is configured.

---

## UFW Configuration Script

A script named `ufw_configuration.sh` was created to apply all the firewall rules automatically.

The script contains:

```bash
#!/bin/bash

sudo ufw allow ssh
sudo ufw deny http
sudo ufw allow https
sudo ufw deny ftp
sudo ufw enable
sudo ufw status verbose
```

The script was made executable using:

```bash
chmod +x ufw_configuration.sh
```

It can be executed using:

```bash
./ufw_configuration.sh
```

---

## Why These Rules Were Chosen

* **SSH (22) — Allow:** Required for remote administration of a Linux

