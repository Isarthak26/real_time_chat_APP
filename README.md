# 🚀 Real-Time Chat Application — DevOps + Monitoring Project

## 📌 Overview

This project demonstrates a **production-grade DevOps pipeline** for deploying a real-time chat application on Azure, along with **monitoring using Prometheus and Grafana**.

The application is containerized using Docker, deployed on Kubernetes (AKS), automated via Jenkins CI/CD, and monitored in real time.

---

# 🎯 Objective

To build a complete DevOps system that includes:

* Infrastructure provisioning using Terraform
* CI/CD automation using Jenkins
* Containerization using Docker
* Deployment using Kubernetes (AKS)
* Monitoring using Prometheus & Grafana

---

# 🧠 Architecture

```text id="arc1"
Developer → GitHub → Jenkins → Docker → ACR → AKS → Users
                                                   ↓
                                           Prometheus
                                                   ↓
                                                Grafana
```

---

# ⚙️ Tech Stack

## ☁️ Cloud & DevOps

* Azure (AKS, ACR, VM)
* Terraform (Infrastructure as Code)
* Jenkins (CI/CD Pipeline)
* Docker
* Kubernetes

## 🧑‍💻 Application

* Node.js
* Express.js
* WebSockets (Real-time chat)

## 📊 Monitoring

* Prometheus
* Grafana
* kube-prometheus-stack (Helm)

---

# 📂 Project Structure

```text id="struct1"
├── server/
│   ├── app.js
│   ├── package.json
│   └── Dockerfile
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/
│   └── main.tf
│
├── Jenkinsfile
└── README.md
```

---

# 🚀 Infrastructure Setup (Terraform)

Provision Azure resources:

* Resource Group
* AKS Cluster
* ACR (Container Registry)

```bash id="tf1"
terraform init
terraform plan
terraform apply
```

---

# 🐳 Docker Setup

### Build image

```bash id="dock1"
docker build -t chat-app .
```

### Run locally

```bash id="dock2"
docker run -p 3500:3500 chat-app
```

---

# ☸️ Kubernetes Deployment

```bash id="k81"
kubectl apply -f k8/
```

Check:

```bash id="k82"
kubectl get pods
kubectl get svc
```

👉 Service type: `LoadBalancer`

---

# 🔁 CI/CD Pipeline (Jenkins)

## Pipeline Stages

1. Checkout code
2. Build Docker image
3. Push image to Azure Container Registry (ACR)
4. Deploy to AKS

### Sample Deployment Step

```groovy id="jen1"
stage('Deploy') {
  steps {
    sh '''
    kubectl set image deployment/chat-app \
    chat-app=$ACR/$IMAGE:$BUILD_NUMBER
    '''
  }
}
```

---

# 🌐 Access Application

```text id="url1"
http://<LoadBalancer-IP>
```

---

# 📊 Monitoring & Observability

This project integrates **Prometheus and Grafana** for real-time monitoring of Kubernetes workloads.

---

## 🔥 Install Monitoring Stack

```bash id="mon1"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack
```

---

## 🔍 Check Monitoring Pods

```bash id="mon2"
kubectl get pods
```

---

## 📈 Access Grafana

```bash id="mon3"
kubectl port-forward svc/monitoring-grafana 3000:80
```

Open:

```text id="url2"
http://localhost:3000
```

---

## 🔐 Grafana Login

```text id="graf1"
Username: admin
Password:
```

Get password:

```bash id="mon4"
kubectl get secret monitoring-grafana \
-o jsonpath="{.data.admin-password}" | base64 --decode
```

---

## 📊 What You Can Monitor

* Pod CPU usage
* Memory usage
* Node health
* Kubernetes cluster metrics
* Application performance

---

# 🎯 Key Features

✔ Real-time chat system
✔ Fully automated CI/CD pipeline
✔ Docker-based containerization
✔ Kubernetes deployment (AKS)
✔ Cloud-native architecture
✔ Monitoring with Prometheus & Grafana
✔ Scalable infrastructure

---

# 🧪 Troubleshooting

### ImagePullBackOff

```bash id="tr1"
az aks update --attach-acr <acr-name>
```

### Docker permission issue

```bash id="tr2"
sudo usermod -aG docker jenkins
```

### Kubernetes debug

```bash id="tr3"
kubectl describe pod <pod-name>
```

---

# 🎯 What This Project Demonstrates

* CI/CD automation using Jenkins
* Infrastructure as Code (Terraform)
* Container lifecycle management
* Kubernetes orchestration
* Cloud deployment on Azure
* Monitoring and observability

---

# 🎤 Viva Explanation

> “This project automates application deployment using Jenkins, Docker, and Kubernetes on Azure. It also integrates Prometheus and Grafana for monitoring system performance and health.”

---

# 🚀 Future Enhancements

* Horizontal Pod Autoscaler (HPA)
* Alerting (Slack/Email)
* Helm charts
* Blue-Green deployment
* GitHub webhook triggers

---

# 👨‍💻 Author

Sarthak Bordia
