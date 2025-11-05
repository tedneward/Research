title=Network Security
tags=security
summary=Links and notes.
~~~~~~

## Network architecture

- [Network-segmentation-cheat-sheet](https://github.com/sergiomarotco/Network-segmentation-cheat-sheet) - This project was created to publish the best practices for segmentation of the corporate network of any company. In general, the schemes in this project are suitable for any company.

## Scanning / Pentesting

- [OpenVAS](http://www.openvas.org/) - OpenVAS is a framework of several services and tools offering a comprehensive and powerful vulnerability scanning and vulnerability management solution.
- [Metasploit Framework](https://github.com/rapid7/metasploit-framework) - A tool for developing and executing exploit code against a remote target machine. Other important sub-projects include the Opcode Database, shellcode archive and related research.
- [Kali](https://www.kali.org/) - Kali Linux is a Debian-derived Linux distribution designed for digital forensics and penetration testing. Kali Linux is preinstalled with numerous penetration-testing programs, including nmap (a port scanner), Wireshark (a packet analyzer), John the Ripper (a password cracker), and Aircrack-ng (a software suite for penetration-testing wireless LANs).
- [tsurugi](https://tsurugi-linux.org/) - heavily customized Linux distribution that designed to support DFIR investigations, malware analysis and OSINT activities. It is based on Ubuntu 20.04(64-bit with a 5.15.12 custom kernel)
- [pig](https://github.com/rafael-santiago/pig) - A Linux packet crafting tool.
- [scapy](https://github.com/gpotter2/awesome-scapy) - Scapy: the python-based interactive packet manipulation program & library.
- [Pompem](https://github.com/rfunix/Pompem) - Pompem is an open source tool, which is designed to automate the search for exploits in major databases. Developed in Python, has a system of advanced search, thus facilitating the work of pentesters and ethical hackers. In its current version, performs searches in databases: Exploit-db, 1337day, Packetstorm Security...
- [Nmap](https://nmap.org) - Nmap is a free and open source utility for network discovery and security auditing.
- [Amass](https://github.com/caffix/amass) - Amass performs DNS subdomain enumeration by scraping the largest number of disparate data sources, recursive brute forcing, crawling of web archives, permuting and altering names, reverse DNS sweeping and other techniques.
- [Anevicon](https://github.com/rozgo/anevicon) - The most powerful UDP-based load generator, written in Rust.
- [Finshir](https://github.com/isgasho/finshir) - A coroutines-driven Low & Slow traffic generator, written in Rust.
- [Legion](https://github.com/GoVanguard/legion) - Open source semi-automated discovery and reconnaissance network penetration testing framework.
- [Sublist3r](https://github.com/aboul3la/Sublist3r) - Fast subdomains enumeration tool for penetration testers
- [RustScan](https://github.com/RustScan/RustScan) - Faster Nmap scanning with Rust. Take a 17 minute Nmap scan down to 19 seconds.
- [Boofuzz](https://github.com/jtpereyda/boofuzz) - Fuzzing engine and fuzz testing framework.
- [monsoon](https://github.com/RedTeamPentesting/monsoon) - Very flexible and fast interactive HTTP enumeration/fuzzing.
- [Netz](https://github.com/spectralops/netz)- Discover internet-wide misconfigurations, using zgrab2 and others.
- [Deepfence ThreatMapper](https://github.com/deepfence/ThreatMapper) - Apache v2, powerful runtime vulnerability scanner for kubernetes, virtual machines and serverless.
- [Deepfence SecretScanner](https://github.com/deepfence/SecretScanner) - Find secrets and passwords in container images and file systems.
- [Cognito Scanner](https://github.com/padok-team/cognito-scanner) - CLI tool to pentest Cognito AWS instance. It implements three attacks: unwanted account creation, account oracle and identity pool escalation

## Monitoring / Logging

- [BoxyHQ](https://github.com/retracedhq/retraced) - Open source API for security and compliance audit logging.
- [justniffer](http://justniffer.sourceforge.net/) - Justniffer is a network protocol analyzer that captures network traffic and produces logs in a customized way, can emulate Apache web server log files, track response times and extract all "intercepted" files from the HTTP traffic.
- [httpry](http://dumpsterventures.com/jason/httpry/) - httpry is a specialized packet sniffer designed for displaying and logging HTTP traffic. It is not intended to perform analysis itself, but to capture, parse, and log the traffic for later analysis. It can be run in real-time displaying the traffic as it is parsed, or as a daemon process that logs to an output file. It is written to be as lightweight and flexible as possible, so that it can be easily adaptable to different applications.
- [ngrep](http://ngrep.sourceforge.net/) - ngrep strives to provide most of GNU grep's common features, applying them to the network layer. ngrep is a pcap-aware tool that will allow you to specify extended regular or hexadecimal expressions to match against data payloads of packets. It currently recognizes IPv4/6, TCP, UDP, ICMPv4/6, IGMP and Raw across Ethernet, PPP, SLIP, FDDI, Token Ring and null interfaces, and understands BPF filter logic in the same fashion as more common packet sniffing tools, such as tcpdump and snoop.
- [passivedns](https://github.com/gamelinux/passivedns) - A tool to collect DNS records passively to aid Incident handling, Network Security Monitoring (NSM) and general digital forensics. PassiveDNS sniffs traffic from an interface or reads a pcap-file and outputs the DNS-server answers to a log file. PassiveDNS can cache/aggregate duplicate DNS answers in-memory, limiting the amount of data in the logfile without loosing the essens in the DNS answer.
- [sagan](http://sagan.quadrantsec.com/) - Sagan uses a 'Snort like' engine and rules to analyze logs (syslog/event log/snmptrap/netflow/etc).
- [ntopng](http://www.ntop.org/products/traffic-analysis/ntop/) - Ntopng is a network traffic probe that shows the network usage, similar to what the popular top Unix command does.
- [Fibratus](https://github.com/rabbitstack/fibratus) - Fibratus is a tool for exploration and tracing of the Windows kernel. It is able to capture the most of the Windows kernel activity - process/thread creation and termination, file system I/O, registry, network activity, DLL loading/unloading and much more. Fibratus has a very simple CLI which encapsulates the machinery to start the kernel event stream collector, set kernel event filters or run the lightweight Python modules called filaments.
- [opensnitch](https://github.com/evilsocket/opensnitch) - OpenSnitch is a GNU/Linux port of the Little Snitch application firewall
- [wazuh](https://github.com/wazuh/wazuh) - Wazuh is a free and open source platform used for threat prevention, detection, and response. It is capable of monitoring file system  changes, system calls and inventory changes.
- [Matano](https://github.com/matanolabs/matano): Open source serverless security lake platform on AWS that lets you ingest, store, and analyze petabytes of security data into an Apache Iceberg data lake and run realtime Python detections as code.
- [Falco](https://falco.org/) - The cloud-native runtime security project and de facto Kubernetes threat detection engine now part of the CNCF.
- [VAST](https://github.com/tenzir/vast) - Open source security data pipeline engine for structured event data, supporting high-volume telemetry ingestion, compaction, and retrieval; purpose-built for security content execution, guided threat hunting, and large-scale investigation.
- [Substation](https://github.com/brexhq/substation) - Substation is a cloud native data pipeline and transformation toolkit written in Go.

## IDS / IPS / Host IDS / Host IPS

- [Snort](https://www.snort.org/) - Snort is a free and open source network intrusion prevention system (NIPS) and network intrusion detection system (NIDS)created by Martin Roesch in 1998. Snort is now developed by Sourcefire, of which Roesch is the founder and CTO. In 2009, Snort entered InfoWorld's Open Source Hall of Fame as one of the "greatest [pieces of] open source software of all time".
- [Zeek](https://zeek.org/) - Zeek is a powerful network analysis framework that is much different from the typical IDS you may know.
  - [zeek2es](https://github.com/corelight/zeek2es) - An open source tool to convert Zeek logs to Elastic/OpenSearch.  You can also output pure JSON from Zeek's TSV logs!
- [DrKeithJones.com](https://drkeithjones.com) - A blog on cyber security and network security monitoring. 
- [OSSEC](https://ossec.github.io/) - Comprehensive Open Source HIDS. Not for the faint of heart. Takes a bit to get your head around how it works. Performs log analysis, file integrity checking, policy monitoring, rootkit detection, real-time alerting and active response. It runs on most operating systems, including Linux, MacOS, Solaris, HP-UX, AIX and Windows. Plenty of reasonable documentation. Sweet spot is medium to large deployments.
- [Suricata](http://suricata-ids.org/) - Suricata is a high performance Network IDS, IPS and Network Security Monitoring engine. Open Source and owned by a community run non-profit foundation, the Open Information Security Foundation (OISF). Suricata is developed by the OISF and its supporting vendors.
- [Security Onion](http://blog.securityonion.net/) - Security Onion is a Linux distro for intrusion detection, network security monitoring, and log management. It's based on Ubuntu and contains Snort, Suricata, Zeek, OSSEC, Sguil, Squert, Snorby, ELSA, Xplico, NetworkMiner, and many other security tools. The easy-to-use Setup wizard allows you to build an army of distributed sensors for your enterprise in minutes!
- [sshwatch](https://github.com/marshyski/sshwatch) - IPS for SSH similar to DenyHosts written in Python.  It also can gather information about attacker during the attack in a log.
- [Stealth](https://fbb-git.gitlab.io/stealth/) - File integrity checker that leaves virtually no sediment. Controller runs from another machine, which makes it hard for an attacker to know that the file system is being checked at defined pseudo random intervals over SSH. Highly recommended for small to medium deployments.
- [AIEngine](https://bitbucket.org/camp0/aiengine) - AIEngine is a next generation interactive/programmable Python/Ruby/Java/Lua packet inspection engine with capabilities of learning without any human intervention, NIDS(Network Intrusion Detection System) functionality, DNS domain classification, network collector, network forensics and many others.
- [Denyhosts](http://denyhosts.sourceforge.net/) - Thwart SSH dictionary based attacks and brute force attacks.
- [Fail2Ban](http://www.fail2ban.org/wiki/index.php/Main_Page) - Scans log files and takes action on IPs that show malicious behavior.
- [SSHGuard](http://www.sshguard.net/) - A software to protect services in addition to SSH, written in C
- [Lynis](https://cisofy.com/lynis/) - an open source security auditing tool for Linux/Unix.
- [CrowdSec](https://github.com/crowdsecurity/crowdsec) - CrowdSec is a free, modern & collaborative behavior detection engine, coupled with a global IP reputation network. It stacks on Fail2Ban's philosophy but is IPV6 compatible and 60x faster (Go vs Python), uses Grok patterns to parse logs and YAML scenario to identify behaviors. CrowdSec is engineered for modern Cloud / Containers / VM based infrastructures (by decoupling detection and remediation). Once detected, you can remedy threats with various bouncers (firewall block, nginx http 403, Captchas, etc.) while the aggressive IPs can be sent to CrowdSec for curation before being shared among all users to further strengthen the community
- [wazuh](https://github.com/wazuh/wazuh) - Wazuh is a free and open source XDR platform used for threat prevention, detection, and response. It is capable of protecting workloads across on-premises, virtualized, containerized, and cloud-based environments. Great tool foor all kind of deployments, it includes SIEM capabitilies (indexing + searching + WUI).

## Honey Pot / Honey Net

- [awesome-honeypots](https://github.com/paralax/awesome-honeypots) - The canonical awesome honeypot list.
- [HoneyPy](https://github.com/foospidy/HoneyPy) - HoneyPy is a low to medium interaction honeypot. It is intended to be easy to: deploy, extend functionality with plugins, and apply custom configurations.
- [Conpot](http://conpot.org/) - ICS/SCADA Honeypot. Conpot is a low interactive server side Industrial Control Systems honeypot designed to be easy to deploy, modify and extend. By providing a range of common industrial control protocols we created the basics to build your own system, capable to emulate complex infrastructures to convince an adversary that he just found a huge industrial complex. To improve the deceptive capabilities, we also provided the possibility to server a custom human machine interface to increase the honeypots attack surface. The response times of the services can be artificially delayed to mimic the behaviour of a system under constant load. Because we are providing complete stacks of the protocols, Conpot can be accessed with productive HMI's or extended with real hardware. Conpot is developed under the umbrella of the Honeynet Project and on the shoulders of a couple of very big giants.
- [Amun](https://github.com/zeroq/amun) - Amun Python-based low-interaction Honeypot.
- [Glastopf](http://glastopf.org/) - Glastopf is a Honeypot which emulates thousands of vulnerabilities to gather data from attacks targeting web applications. The principle behind it is very simple: Reply the correct response to the attacker exploiting the web application.
- [Kippo](https://github.com/desaster/kippo) - Kippo is a medium interaction SSH honeypot designed to log brute force attacks and, most importantly, the entire shell interaction performed by the attacker.
- [Kojoney](http://kojoney.sourceforge.net/) - Kojoney is a low level interaction honeypot that emulates an SSH server. The daemon is written in Python using the Twisted Conch libraries.
- [HonSSH](https://github.com/tnich/honssh) - HonSSH is a high-interaction Honey Pot solution. HonSSH will sit between an attacker and a honey pot, creating two separate SSH connections between them.
- [Bifrozt](http://sourceforge.net/projects/bifrozt/) - Bifrozt is a NAT device with a DHCP server that is usually deployed with one NIC connected directly to the Internet and one NIC connected to the internal network. What differentiates Bifrozt from other standard NAT devices is its ability to work as a transparent SSHv2 proxy between an attacker and your honeypot. If you deployed an SSH server on Bifrozt’s internal network it would log all the interaction to a TTY file in plain text that could be viewed later and capture a copy of any files that were downloaded. You would not have to install any additional software, compile any kernel modules or use a specific version or type of operating system on the internal SSH server for this to work. It will limit outbound traffic to a set number of ports and will start to drop outbound packets on these ports when certain limits are exceeded.
- [HoneyDrive](http://bruteforce.gr/honeydrive) - HoneyDrive is the premier honeypot Linux distro. It is a virtual appliance (OVA) with Xubuntu Desktop 12.04.4 LTS edition installed. It contains over 10 pre-installed and pre-configured honeypot software packages such as Kippo SSH honeypot, Dionaea and Amun malware honeypots, Honeyd low-interaction honeypot, Glastopf web honeypot and Wordpot, Conpot SCADA/ICS honeypot, Thug and PhoneyC honeyclients and more. Additionally it includes many useful pre-configured scripts and utilities to analyze, visualize and process the data it can capture, such as Kippo-Graph, Honeyd-Viz, DionaeaFR, an ELK stack and much more. Lastly, almost 90 well-known malware analysis, forensics and network monitoring related tools are also present in the distribution.
- [Cuckoo Sandbox](http://www.cuckoosandbox.org/) - Cuckoo Sandbox is an Open Source software for automating analysis of suspicious files. To do so it makes use of custom components that monitor the behavior of the malicious processes while running in an isolated environment.
- [T-Pot Honeypot Distro](http://dtag-dev-sec.github.io/mediator/feature/2017/11/07/t-pot-17.10.html) - T-Pot is based on the network installer of Ubuntu Server 16/17.x LTS. The honeypot daemons as well as other support components being used have been containerized using docker. This allows us to run multiple honeypot daemons on the same network interface while maintaining a small footprint and constrain each honeypot within its own environment. Installation over vanilla Ubuntu - [T-Pot Autoinstall](https://github.com/dtag-dev-sec/t-pot-autoinstall) - This script will install T-Pot 16.04/17.10 on a fresh Ubuntu 16.04.x LTS (64bit). It is intended to be used on hosted servers, where an Ubuntu base image is given and there is no ability to install custom ISO images. Successfully tested on vanilla Ubuntu 16.04.3 in VMware.

## Full Packet Capture / Forensic

- [tcpflow](https://github.com/simsong/tcpflow) - tcpflow is a program that captures data transmitted as part of TCP connections (flows), and stores the data in a way that is convenient for protocol analysis and debugging. Each TCP flow is stored in its own file. Thus, the typical TCP flow will be stored in two files, one for each direction. tcpflow can also process stored 'tcpdump' packet flows.
- [Deepfence PacketStreamer](https://github.com/deepfence/PacketStreamer) - High-performance remote packet capture and collection tool, distributed tcpdump for cloud native environments.
- [Xplico](http://www.xplico.org/) - The goal of Xplico is extract from an internet traffic capture the applications data contained. For example, from a pcap file Xplico extracts each email (POP, IMAP, and SMTP protocols), all HTTP contents, each VoIP call (SIP), FTP, TFTP, and so on. Xplico isn’t a network protocol analyzer. Xplico is an open source Network Forensic Analysis Tool (NFAT).
- [Moloch](https://github.com/aol/moloch) - Moloch is an open source, large scale IPv4 packet capturing (PCAP), indexing and database system. A simple web interface is provided for PCAP browsing, searching, and exporting. APIs are exposed that allow PCAP data and JSON-formatted session data to be downloaded directly. Simple security is implemented by using HTTPS and HTTP digest password support or by using apache in front. Moloch is not meant to replace IDS engines but instead work along side them to store and index all the network traffic in standard PCAP format, providing fast access. Moloch is built to be deployed across many systems and can scale to handle multiple gigabits/sec of traffic.
- [OpenFPC](http://www.openfpc.org) - OpenFPC is a set of tools that combine to provide a lightweight full-packet network traffic recorder & buffering system. It's design goal is to allow non-expert users to deploy a distributed network traffic recorder on COTS hardware while integrating into existing alert and log management tools.
- [Dshell](https://github.com/USArmyResearchLab/Dshell) - Dshell is a network forensic analysis framework. Enables rapid development of plugins to support the dissection of network packet captures.
- [stenographer](https://github.com/google/stenographer) - Stenographer is a packet capture solution which aims to quickly spool all packets to disk, then provide simple, fast access to subsets of those packets.

## Sniffer

- [wireshark](https://www.wireshark.org) - Wireshark is a free and open-source packet analyzer. It is used for network troubleshooting, analysis, software and communications protocol development, and education. Wireshark is very similar to tcpdump, but has a graphical front-end, plus some integrated sorting and filtering options.
- [netsniff-ng](http://netsniff-ng.org/) -  netsniff-ng is a free Linux networking toolkit, a Swiss army knife for your daily Linux network plumbing if you will. Its gain of performance is reached by zero-copy mechanisms, so that on packet reception and transmission the kernel does not need to copy packets from kernel space to user space and vice versa.
- [Live HTTP headers ](https://addons.mozilla.org/en-US/firefox/addon/http-header-live/) - Live HTTP headers is a free firefox addon to see your browser requests in real time. It shows the entire headers of the requests and can be used to find the security loopholes in implementations.

## Security Information & Event Management

- [Prelude](https://www.prelude-siem.org/) - Prelude is a Universal "Security Information & Event Management" (SIEM) system. Prelude collects, normalizes, sorts, aggregates, correlates and reports all security-related events independently of the product brand or license giving rise to such events; Prelude is "agentless".
- [OSSIM](https://www.alienvault.com/open-threat-exchange/projects) - OSSIM provides all of the features that a security professional needs from a SIEM offering – event collection, normalization, and correlation.
- [FIR](https://github.com/certsocietegenerale/FIR) - Fast Incident Response, a cybersecurity incident management platform.
- [LogESP](https://github.com/dogoncouch/LogESP) - Open Source SIEM (Security Information and Event Management system).
- [wazuh](https://github.com/wazuh/wazuh) -Wazuh is a free, open source and enterprise-ready security monitoring solution for threat detection, integrity monitoring, incident response and compliance. It works with tons of data supported by an OpenSearch fork and custom WUI.
- [VAST](https://github.com/tenzir/vast) - Open source security data pipeline engine for structured event data, supporting high-volume telemetry ingestion, compaction, and retrieval; purpose-built for security content execution, guided threat hunting, and large-scale investigation.
- [Matano](https://github.com/matanolabs/matano) - Open source serverless security lake platform on AWS that lets you ingest, store, and analyze petabytes of security data into an Apache Iceberg data lake and run realtime Python detections as code.

## VPN

- [OpenVPN](https://openvpn.net/) - OpenVPN is an open source software application that implements virtual private network (VPN) techniques for creating secure point-to-point or site-to-site connections in routed or bridged configurations and remote access facilities. It uses a custom security protocol that utilizes SSL/TLS for key exchange.
- [Firezone](https://github.com/firezone/firezone) - Open-source VPN server and egress firewall for Linux built on WireGuard that makes it simple to manage secure remote access to your company’s private networks. Firezone is easy to set up (all dependencies are bundled thanks to Chef Omnibus), secure, performant, and self hostable.

## Fast Packet Processing

- [DPDK](http://dpdk.org/) - DPDK is a set of libraries and drivers for fast packet processing.
- [PFQ](https://github.com/pfq/PFQ) - PFQ is a functional networking framework designed for the Linux operating system that allows efficient packets capture/transmission (10G and beyond), in-kernel functional processing and packets steering across sockets/end-points.
- [PF_RING](http://www.ntop.org/products/packet-capture/pf_ring/) - PF_RING is a new type of network socket that dramatically improves the packet capture speed.
- [PF_RING ZC (Zero Copy)](http://www.ntop.org/products/packet-capture/pf_ring/pf_ring-zc-zero-copy/) - PF_RING ZC (Zero Copy) is a flexible packet processing framework that  allows you to achieve 1/10 Gbit line rate packet processing (both RX and TX) at any packet size. It implements zero copy operations including patterns for inter-process and inter-VM (KVM) communications.
- [PACKET_MMAP/TPACKET/AF_PACKET](https://elixir.bootlin.com/linux/latest/source/Documentation/networking/packet_mmap.rst) - It's fine to use PACKET_MMAP to improve the performance of the capture and transmission process in Linux.
- [netmap](http://info.iet.unipi.it/~luigi/netmap/) - netmap is a framework for high speed packet I/O. Together with its companion VALE software switch, it is implemented as a single kernel module and available for FreeBSD, Linux and now also Windows.

## Firewall

- [pfSense](https://www.pfsense.org/) - Firewall and Router FreeBSD distribution.
- [OPNsense](https://opnsense.org/) - is an open source, easy-to-use and easy-to-build FreeBSD based firewall and routing platform. OPNsense includes most of the features available in expensive commercial firewalls, and more in many cases. It brings the rich feature set of commercial offerings with the benefits of open and verifiable sources.
- [fwknop](https://www.cipherdyne.org/fwknop/) - Protects ports via Single Packet Authorization in your firewall.

## Anti-Spam

- [Spam Scanner](https://github.com/spamscanner) - Anti-Spam Scanning Service and Anti-Spam API by [@niftylettuce](https://github.com/niftylettuce).
- [rspamd](https://github.com/rspamd/rspamd) - Fast, free and open-source spam filtering system.
- [SpamAssassin](https://spamassassin.apache.org/) - A powerful and popular email spam filter employing a variety of detection technique.
- [Scammer-List](https://scammerlist.now.sh/) - A free open source AI based Scam and Spam Finder with a free API

## Docker Images for Penetration Testing & Security

- `docker pull kalilinux/kali-linux-docker` [official Kali Linux](https://hub.docker.com/r/kalilinux/kali-linux-docker/)
- `docker pull owasp/zap2docker-stable` - [official OWASP ZAP](https://github.com/zaproxy/zaproxy)
- `docker pull wpscanteam/wpscan` - [official WPScan](https://hub.docker.com/r/wpscanteam/wpscan/)
- `docker pull remnux/metasploit` - [docker-metasploit](https://hub.docker.com/r/remnux/metasploit/)
- `docker pull citizenstig/dvwa` - [Damn Vulnerable Web Application (DVWA)](https://hub.docker.com/r/citizenstig/dvwa/)
- `docker pull wpscanteam/vulnerablewordpress` - [Vulnerable WordPress Installation](https://hub.docker.com/r/wpscanteam/vulnerablewordpress/)
- `docker pull hmlio/vaas-cve-2014-6271` - [Vulnerability as a service: Shellshock](https://hub.docker.com/r/hmlio/vaas-cve-2014-6271/)
- `docker pull hmlio/vaas-cve-2014-0160` - [Vulnerability as a service: Heartbleed](https://hub.docker.com/r/hmlio/vaas-cve-2014-0160/)
- `docker pull opendns/security-ninjas` - [Security Ninjas](https://hub.docker.com/r/opendns/security-ninjas/)
- `docker pull diogomonica/docker-bench-security` - [Docker Bench for Security](https://hub.docker.com/r/diogomonica/docker-bench-security/)
- `docker pull ismisepaul/securityshepherd` - [OWASP Security Shepherd](https://hub.docker.com/r/ismisepaul/securityshepherd/)
- `docker pull danmx/docker-owasp-webgoat` - [OWASP WebGoat Project docker image](https://hub.docker.com/r/danmx/docker-owasp-webgoat/)
- `docker-compose build && docker-compose up` - [OWASP NodeGoat](https://github.com/owasp/nodegoat#option-3---run-nodegoat-on-docker)
- `docker pull citizenstig/nowasp` - [OWASP Mutillidae II Web Pen-Test Practice Application](https://hub.docker.com/r/citizenstig/nowasp/)
- `docker pull bkimminich/juice-shop` - [OWASP Juice Shop](https://hub.docker.com/r/bkimminich/juice-shop)
- `docker pull jeroenwillemsen/wrongsecrets`- [OWASP WrongSecrets](https://hub.docker.com/r/jeroenwillemsen/wrongsecrets)
- `docker run -dit --name trd -p 8081:80 cylabs/cy-threat-response` - [Cyware Threat Response Docker](https://hub.docker.com/r/cylabs/cy-threat-response)
- `docker-compose -d up` - [cicd-goat](https://github.com/cider-security-research/cicd-goat)
