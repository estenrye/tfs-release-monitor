# Where I left off
## 2020-04-16

Graylog secrets are configured.  Build docker files to house tooling around
setting secrets.  Need to investigate the following:

* Why is the Bitnami MongoDB image not properly configuring the replica set?
* Why is the Bitnami MongoDB image not properly configuring the `root` user?
* Why is the Bitnami MongoDB image not properly creating the `graylog` database?
* Why is the Bitnami MongoDB image not properly creating the `graylog` user?



## 2020-04-15

Copied graylog default config file.  Need to review it and update it to reflect
my stack's layout and setup.

On first glance, it looks like I will be able to add the list of elastic nodes
to the config file.  This will likely be the easiest course of action, but part
of me wonders if it is the most extensible one.  There are scalability advantages
to abstracting the elastic nodes from the graylog nodes with a load balancer.
These include:

* being able to scale the elastic cluster independent of the graylog cluster
  without needing to update the graylog config with a new host every time.
* Setting up TLS at the load balancer for elastic and managing it in one place.
* Better trace visibility for troubleshooting graylog.

Need to review graylog documentation to determine whether a load balancer is
even a good idea.  In the short term though for the project, hard coding the
elastic nodes is sufficent for a minimum viable product.

Once graylog is installed and running, will need to look into finding a container
for FluentBit and start capturing the swarm logs and system logs in GrayLog.