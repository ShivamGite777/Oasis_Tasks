
# Task 8 – Capture Network Traffic with Wireshark

## Objective

Capture live network traffic using Wireshark, apply filters to isolate specific protocols, analyse packet contents, and document security observations.

## Tools Used

* Wireshark
* Kali Linux
* Local network interface
* Linux Terminal

---

## 1. Installing Wireshark

Wireshark was checked/installed on Kali Linux.

The installation was performed using:

```bash
sudo apt update
sudo apt install wireshark -y
```

The installed version was verified using:

```bash
wireshark --version
```

### Packet Capture Permissions

Wireshark may require elevated permissions or packet-capture permissions to capture traffic from a network interface.

During installation, if prompted whether non-superusers should be allowed to capture packets, the appropriate permission was enabled.

---

## 2. Live Traffic Capture

Wireshark was opened using:

```bash
wireshark
```

The active local network interface was selected and live traffic was captured for at least **2 minutes**.

Normal network activity was generated during the capture to collect different types of packets.

The capture was then stopped after approximately two minutes.

---

## 3. HTTP Traffic Analysis

The following Wireshark display filter was used:

```text
http
```

This filter displays packets identified as HTTP traffic.

HTTP packets can contain readable request and response information because normal HTTP traffic is not encrypted.

### Screenshot

`wireshark-http.png`

---

## 4. DNS Traffic Analysis

The following display filter was used:

```text
dns
```

This filter displays DNS queries and responses.

DNS traffic can show information such as domain names being requested and the corresponding DNS responses.

### Screenshot

`wireshark-dns.png`

---

## 5. TCP Traffic and 3-Way Handshake

The following display filter was used:

```text
tcp
```

A TCP connection starts with a **three-way handshake**.

The sequence observed was:

```text
1. SYN
      ↓
2. SYN-ACK
      ↓
3. ACK
```

### SYN

The client sends a **SYN** packet to request the establishment of a TCP connection.

### SYN-ACK

The server responds with **SYN-ACK**, acknowledging the client's request and sending its own synchronization request.

### ACK

The client sends an **ACK** packet to confirm the server's response.

After these three packets, the TCP connection can begin transferring application data.

### Screenshot

`wireshark-tcp-handshake.png`

The screenshot shows the SYN, SYN-ACK, and ACK packets used to establish the TCP connection.

---

## 6. Unencrypted HTTP Data

An HTTP packet was inspected in Wireshark to identify information that can be viewed in readable form.

For example, an HTTP request may contain:

```text
GET / HTTP/1.1
Host: example.com
```

Because HTTP does not encrypt the communication, information contained in the request may be visible to someone who can capture the network traffic.

### Security Risk

Unencrypted HTTP traffic can expose sensitive information such as:

* Requested URLs
* Hostnames
* HTTP headers
* Web page content
* Data sent through HTTP requests

Therefore, HTTP should not be used for transmitting sensitive information.

---

## 7. Why HTTP is Dangerous

HTTP sends data without encryption.

If an attacker can capture network traffic, the attacker may be able to read or analyse the contents of the communication.

This can lead to:

* Information disclosure
* Session or credential exposure when applications transmit them insecurely
* Privacy violations
* Traffic interception

For this reason, sensitive web communication should use HTTPS.

---

## 8. How HTTPS Prevents Eavesdropping

HTTPS uses **TLS (Transport Layer Security)** to encrypt communication between the client and the web server.

With HTTPS:

* Data is encrypted during transmission.
* Attackers capturing packets cannot normally read the encrypted application data.
* The server's identity can be authenticated using digital certificates.
* Data integrity is protected against unauthorized modification.

Therefore, HTTPS provides significantly stronger protection against network eavesdropping than HTTP.

---

## 9. Capture File

The captured traffic was exported as:

```text
wireshark_capture.pcap
```

This file contains the captured network packets and can be reopened in Wireshark for further analysis.

---

## 10. Screenshots

The following screenshots were included as evidence:

* `wireshark-install.png` — Wireshark installation/version
* `wireshark-2min-capture.png` — Live traffic capture
* `wireshark-http.png` — HTTP filtered traffic
* `wireshark-dns.png` — DNS filtered traffic
* `wireshark-tcp-handshake.png` — TCP 3-way handshake
* `wireshark-http-packet.png` — Unencrypted HTTP packet

---

## 11. Glossary

### Packet

A **packet** is a small unit of data sent across a network.

### Protocol

A **protocol** is a set of rules that devices follow to communicate with each other.

### Port

A **port** is a logical communication endpoint used to identify a particular network service or application.

### Payload

The **payload** is the actual useful data carried inside a network packet, excluding the information used to deliver the packet.

### Handshake

A **handshake** is a sequence of messages exchanged between devices to establish or agree on a network connection.

---

## 12. Wireshark Security Observations

The packet capture demonstrated that different protocols produce different types of network traffic.

* DNS packets can reveal domain lookup activity.
* TCP packets show how connections are established.
* HTTP traffic can contain readable application data.
* HTTPS encrypts application data to protect it from network eavesdropping.

Wireshark is therefore useful for understanding network communication and identifying potentially insecure traffic.

---

## Conclusion

Wireshark was successfully used to capture and analyse live network traffic.

HTTP and DNS filters were applied, TCP packets were analysed to identify the three-way handshake, and an unencrypted HTTP packet was inspected.

The exercise demonstrated why unencrypted HTTP traffic can be dangerous and how HTTPS provides encryption and protection against network eavesdropping.

## Ethical Use

Network traffic should only be captured on networks that you own or are explicitly authorized to monitor. Capturing traffic on public Wi-Fi, university networks, or other networks without permission may violate privacy and security policies.
