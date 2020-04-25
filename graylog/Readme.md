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

# Configuring Graylog Cluster Secrets

## Generating a docker secret for Graylog's password secret

```bash
docker run --rm estenrye/graylog-password-secret-generator 96 | docker secret create graylog_password_secret -
```

## Generating a docker secret for Graylog's Root User Password Hash

```bash
docker run --rm estenrye/graylog-root-password-hasher 'yourpasswordhere' | docker secret create graylog_root_password -
```

## Generating a docker secret for Graylog's MongoDB Connection String

```bash
echo 'mongodb://graylog:graylog@mongo1,mongo2,mongo3/graylog' | docker secret create graylog_mongodb_uri -
```