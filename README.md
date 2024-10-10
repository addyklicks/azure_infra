# Azure Infrastructure Deployment with Terraform

This repository contains Terraform code for deploying an Azure infrastructure that includes the following resources:

- Azure Firewall
- Application Gateway
- Azure Virtual Machine
- Azure Bastion
- Virtual Network Gateway (VPN Gateway)
- SQL Managed Instance
- Virtual Network (VNet) and Subnets

## Architecture Overview

The architecture deployed with this code consists of the following components:

1. **Virtual Network (VNet)**: A logically isolated network in Azure to which all the other resources are connected. The VNet is divided into different subnets, each allocated for specific services like the firewall, application gateway, virtual machines, etc.
2. **Azure Firewall**: Provides network security by filtering traffic into and out of the virtual network. The firewall is placed in a dedicated subnet to manage traffic effectively.

3. **Application Gateway**: A web traffic load balancer that manages incoming requests and routes them to backend virtual machines. It also provides protection via Web Application Firewall (WAF) rules.

4. **Virtual Machines (VMs)**: These are the backend servers that host applications and databases. The VMs are placed in the backend subnet.

5. **Azure Bastion**: A service that allows secure RDP/SSH access to the virtual machines without the need for public IPs on the VMs. This is a secured way to access virtual machines recommend by Microsoft

6. **Virtual Network Gateway**: Enables secure connectivity between Azure and on-premises networks through a VPN or ExpressRoute.

7. **SQL Managed Instance**: A fully managed SQL Server instance hosted in Azure, providing high availability, automated backups, and more.

### Resource Diagram

The diagram below gives a high-level view of the architecture:

## Requirements

- Terraform installed on your local machine
- An Azure account
- Azure CLI configured and logged in (`az login`)
- Access to create resources in a specified Azure region

## Usage

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-repo/azure-infrastructure-deployment.git
cd azure-infrastructure-deployment
```

### Step 2: Configure Variables

Modify the `terraform.tfvars` file or provide the necessary variables through CLI. Key variables include:

- `resource_group_name`: Name of the resource group to create.
- `location`: Azure region where resources will be deployed (e.g., "Central US").
- `admin_username`: Administrator username for the virtual machines.
- `admin_password`: Administrator password for the virtual machines.
- `sql_admin_login`: Administrator username for the SQL Managed Instance.
- `sql_admin_password`: Administrator password for the SQL Managed Instance.

### Step 3: Initialize Terraform

Run the following command to initialize the Terraform environment.

```bash
terraform init
```

### Step 4: Plan the Infrastructure

To preview the resources that will be created, run:

```bash
terraform plan
```

### Step 5: Apply the Configuration

Deploy the infrastructure by running the following command:

```bash
terraform apply
```

Confirm the action when prompted by typing `yes`.

### Step 6: Access the Resources

Once the infrastructure is deployed, you can access the resources:

- **Virtual Machines**: Access via Azure Bastion for RDP/SSH without public IP exposure.
- **Application Gateway**: Use the public IP of the Application Gateway for accessing the load-balanced applications.
- **SQL Managed Instance**: Connect to the SQL Managed Instance using SQL Server Management Studio (SSMS) or other database tools.

### Step 7: Destroy the Infrastructure

To clean up all the resources and avoid charges, run the following command:

```bash
terraform destroy
```

Confirm the action when prompted by typing `yes`.

## Folder Structure

```bash
.
├── modules                     # Modules directory
│   ├── firewall                # Module for Azure Firewall
│   │   ├── main.tf             # Main configuration for firewall
│   │   ├── variables.tf        # Variables required for firewall
│   │   ├── outputs.tf          # Outputs from the firewall module
│   ├── vnet                    # Module for Virtual Network (VNet)
│   │   ├── main.tf             # Main configuration for VNet
│   │   ├── variables.tf        # Variables required for VNet
│   │   ├── outputs.tf          # Outputs from the VNet module
│   ├── subnets                 # Module for subnets
│   │   ├── main.tf             # Main configuration for subnets
│   │   ├── variables.tf        # Variables required for subnet
│   │   ├── outputs.tf          # Outputs from the subnet module
│   ├── app_gateway             # Module for Application Gateway
│   │   ├── main.tf             # Main configuration for Application Gateway
│   │   ├── variables.tf        # Variables required for Application Gateway
│   │   ├── outputs.tf          # Outputs from the Application Gateway module
│   ├── bastion                 # Module for Azure Bastion
│   │   ├── main.tf             # Main configuration for Bastion
│   │   ├── variables.tf        # Variables required for Bastion
│   │   ├── outputs.tf          # Outputs from the Bastion module
│   ├── windowsvm               # Module for Virtual Machines
│   │   ├── main.tf             # Main configuration for Virtual Machines
│   │   ├── variables.tf        # Variables required for Virtual Machines
│   │   ├── outputs.tf          # Outputs from the Virtual Machines module
│   ├── sql_managed_instance    # Module for SQL Managed Instance
│   │   ├── main.tf             # Main configuration for SQL Managed Instance
│   │   ├── variables.tf        # Variables required for SQL Managed Instance
│   │   ├── outputs.tf          # Outputs from the SQL Managed Instance module
│   └── vnet_gateway            # Module for Virtual Network Gateway (VPN Gateway)
│       ├── main.tf             # Main configuration for VNet Gateway
│       ├── variables.tf        # Variables required for VNet Gateway
│       ├── outputs.tf          # Outputs from the VNet Gateway module
├── main.tf                     # Main file that calls the modules
├── variables.tf                # Variables for the root module (global variables)
├── terraform.tfvars            # User-specific variable values
├── provider.tf                 # Provider configuration for Azure
```
