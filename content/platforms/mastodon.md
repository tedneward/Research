title=Mastodon
tags=platform, social media
summary=a free, open-source social network server based on ActivityPub where users can follow friends and discover new ones. On Mastodon, users can publish anything they want: links, pictures, text, video. All Mastodon servers are interoperable as a federated network (users on one server can seamlessly communicate with users from another one, including non-Mastodon software that implements ActivityPub)!
~~~~~~

[Website](https://joinmastodon.org/) | [Source](https://github.com/tootsuite/mastodon)

A Vagrant configuration is included for development purposes. To use it, complete following steps:

* Install Vagrant and Virtualbox
* Run `vagrant up`
* Run `vagrant ssh -c "cd /vagrant && foreman start"`
* Open http://mastodon.local in your browser

