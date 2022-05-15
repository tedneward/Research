title=Scapy
tags=library, python, distribution, tool
summary=Python-based interactive packet manipulation program & library.
~~~~~~

[Website](https://scapy.net/) | [Source](https://github.com/secdev/scapy)

"Scapy is a powerful interactive packet manipulation program. It is able to forge or decode packets of a wide number of protocols, send them on the wire, capture them, match requests and replies, and much more. It can easily handle most classical tasks like scanning, tracerouting, probing, unit tests, attacks or network discovery (it can replace hping, 85% of nmap, arpspoof, arp-sk, arping, tcpdump, tshark, p0f, etc.). It also performs very well at a lot of other specific tasks that most other tools can’t handle, like sending invalid frames, injecting your own 802.11 frames, combining technics (VLAN hopping+ARP cache poisoning, VOIP decoding on WEP encrypted channel, …), etc.

"Scapy runs natively on Linux, Windows, OSX and on most Unixes with libpcap (see scapy’s installation page)."

Shell demo:
```
$ sudo ./run_scapy -H
Welcome to Scapy (2.4.4.dev221)
>>> p = IP(dst="github.com")/ICMP()
>>> p
<IP  frag=0 proto=icmp dst=Net('github.com') |<ICMP  |>>
>>> r = sr1(p)
Begin emission:
Finished sending 1 packets.
.*
Received 2 packets, got 1 answers, remaining 0 packets
>>> r
<IP  version=4 ihl=5 tos=0x0 len=28 id=59762 flags= frag=0 ttl=57 proto=icmp
chksum=0x7792 src=140.82.121.4 dst=217.25.178.5 |<ICMP  type=echo-reply
code=0 chksum=0xffff id=0x0 seq=0x0 |>>
```

