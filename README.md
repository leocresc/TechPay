# ☁️ AWS 3-Tier Secure Architecture via Terraform

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## 📌 Executive Summary
Progetto di Infrastructure as Code (IaC) che implementa un'architettura cloud a 3 livelli (3-Tier) altamente disponibile e sicura su AWS. Realizzato interamente con Terraform, il progetto dimostra l'applicazione pratica dei principi del Well-Architected Framework, garantendo isolamento di rete, scalabilità automatica e un rigoroso controllo degli accessi, il tutto ingegnerizzato per rientrare nei limiti dell'AWS Free Tier.

## 🏗️ Architecture Overview
L'infrastruttura è segregata logicamente e fisicamente per massimizzare la sicurezza:
- **Presentation Tier (Public):** Un Application Load Balancer (ALB) esposto su subnet pubbliche che funge da unico punto di accesso a Internet, incaricato di smistare il traffico HTTP in ingresso.
- **Logic Tier (Private):** Un Auto Scaling Group (ASG) posizionato in subnet private. Utilizza un Launch Template dinamico per istanziare macchine EC2 (Amazon Linux 2023) in base al carico, operando in totale sicurezza senza mai esporre indirizzi IP pubblici.
- **Data Tier (Private):** Un database relazionale gestito Amazon RDS (PostgreSQL) isolato in un DB Subnet Group dedicato, inaccessibile dall'esterno.

## 🔒 Security & Best Practices
La sicurezza è stata implementata a livello di rete con un approccio "Zero Trust" tra i livelli:
- **Isolamento del traffico:** Le istanze EC2 e il database non possiedono indirizzi IP pubblici. L'intera comunicazione con l'esterno è mediata dall'ALB.
- **Security Group a Cascata:** Le regole di firewalling (Security Groups) sono concatenate. L'App Tier accetta traffico *solo* dal Security Group dell'ALB. Il Data Tier accetta connessioni *solo* dal Security Group dell'App Tier.
- **Gestione Dinamica:** Utilizzo di Terraform `data sources` per il recupero dinamico e automatizzato delle AMI (Amazon Linux) più recenti e sicure, evitando l'hardcoding degli ID.

## 🚀 How to Deploy
Per replicare questa infrastruttura a costo zero utilizzando le credenziali AWS:
