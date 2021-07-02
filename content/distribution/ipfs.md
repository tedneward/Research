title=IPFS (InterPlanetary FileSystem) protocol
tags=distribution, protocol
summary=A peer-to-peer hypermedia protocol designed to preserve and grow humanity's knowledge by making the web upgradeable, resilient, and more open.
~~~~~~

[Website](https://ipfs.io/) | [Source](https://github.com/ipfs) | [Go implementation](https://github.com/ipfs/go-ipfs), [JavaScript implementation](https://js.ipfs.io/) | [Docs](https://docs.ipfs.io/)

#### From the website: How it works
Here's what happens when you add a file to IPFS — whether you're storing that file on your own local node or one operated by a pinning service or IPFS-enabled app.

When you add a file to IPFS, your file is split into smaller chunks, cryptographically hashed, and given a unique fingerprint called a content identifier (CID). This CID acts as an permanent record of your file as it exists at that point in time.

When other nodes look up your file, they ask their peer nodes who's storing the content referenced by the file's CID. When they view or download your file, they cache a copy — and become another provider of your content until their cache is cleared.

A node can pin content in order to keep (and provide) it forever, or discard content it hasn't used in a while to save space. This means each node in the network stores only content it is interested in, plus some indexing information that helps figure out which node is storing what.

If you add a new version of your file to IPFS, its cryptographic hash is different, and so it gets a new CID. This means files stored on IPFS are resistant to tampering and censorship — any changes to a file don't overwrite the original, and common chunks across files can be reused in order to minimize storage costs.

However, this doesn't mean you need to remember a long string of CIDs — IPFS can find the latest version of your file using the IPNS decentralized naming system, and DNSLink can be used to map CIDs to human-readable DNS names.

