# Network File System (NFS) Guide

## What is NFS?
Network File System (NFS) is a distributed file system protocol that allows a client computer to access files over a network as if they were local files.

## Key Features
- 🌐 Distributed file system
- 🖥️ Client-server architecture
- 🔄 Transparent file access over network
- 💻 Supports multiple operating systems
- ⚙️ Stateful and stateless operation modes
- 🔒 File locking and caching mechanisms
- 📈 Scalable architecture for large deployments
- 🔄 Support for NFSv3 and NFSv4 protocols

## NFS Server Setup (Ubuntu)

### 1. Update the System
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install NFS Server
```bash
sudo apt install nfs-kernel-server -y
```

### 3. Create Shared Directory
```bash
sudo mkdir -p /mnt/nfs_share
```

### 4. Set Directory Permissions
```bash
sudo chown nobody:nogroup /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share
```

### 5. Configure Exports
Edit the exports file:
```bash
sudo vim /etc/exports
```

Add the following line (replace `*` with specific IP/CIDR for better security):
```
/mnt/nfs_share *(rw,sync,no_subtree_check)
```

### 6. Apply Configuration
```bash
sudo exportfs -a
```

### 7. Restart NFS Server
```bash
sudo systemctl restart nfs-kernel-server
```

## NFS Client Setup

### 1. Install NFS Client
```bash
sudo apt update
sudo apt install nfs-common -y
```

### 2. Create Mount Point
```bash
sudo mkdir -p /mnt/nfs_client
```

### 3. Mount NFS Share
```bash
sudo mount <server-ip>:/mnt/nfs_share /mnt/nfs_client
```

### 4. Verify Mount
```bash
df -h
```

### 5. Verify Exports
```bash
showmount -e <server-ip>
```

## NFS Port Information
NFS typically uses these ports:
- **2049**: NFS server
- **111**: RPC port mapper

To check if NFS is running:
```bash
# Check NFS port (2049)
sudo netstat -tuln | grep 2049

# Check RPC port (111)
sudo netstat -tuln | grep 111
```

## AWS Integration
In AWS, the service that provides NFS functionality is **Amazon Elastic File System (EFS)**.

## What is NFS Used For?
NFS (Network File System) enables multiple systems or servers to share and access files over a network as if they were on a local disk, providing seamless file sharing across different machines in a network.
