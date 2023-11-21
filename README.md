# MySQL Dump Project

This project contains scripts to establish a secure tunnel to a MySQL server and dump the table schemas, stored procedures, and functions.

## Prerequisites

- SSH access to the MySQL server
- MySQL server credentials
- `mysqldump` utility installed on your local machine

## Setup

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Copy the `.env.example` file and rename it to `.env`.
4. Open the `.env` file and replace the placeholders with your MySQL server credentials and address.
5. Add following to you ~/ssh/config:
``` 
Host my-proxy-hostname
    HostName my.mysql.server
    ControlPath ~/.ssh/my-proxy-hostname.ctl
```

## Usage

### Establish Tunnel

To establish a secure tunnel to the MySQL server, run the `establish_tunnel.sh` script:

```bash
./scripts/establish_tunnel.sh
```

### Dump Schemas

To dump the schemas of the tables in the MySQL database, run the `dump_schemas.sh` script:

```bash
./scripts/dump_schemas.sh
```

The dumped schemas will be stored in the `dumps/schemas` directory.

### Dump Procedures and functions

To dump the stored procedures in the MySQL database, run the `dump_routines.sh` script:

```bash
./scripts/dump_routines.sh
```

The dumped routines will be stored in the `dumps/routines` directory.
