# Configuring a MongoDB ReplicaSet in Docker Swarm.

## Overview

In this Readme we will be configuring a three node replica set for MongoDB in
Docker Swarm using a Docker Compose file and Docker Secrets.

## Generating the Keyfile

The MongoDB keyfile serves as the shared password for the members of the replica
set.  The content of the keyfile must be the same for all members of the replica
set.

To achieve this we will create a Docker Secret that will hold this file securely
in the Swarm.

```bash
docker run --rm estenrye/mongodb-authkey-generator | docker secret create mongo_keyfile -
```

## Root Username Secret creation

```bash
echo 'root-username' | docker secret create mongo_root_username -
```

## Root Password Secret creation

```bash
echo 'root-password' | docker secret create mongo_root_password -
```

