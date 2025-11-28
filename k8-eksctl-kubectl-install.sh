# eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
VALIDATE $? "eksctl installation"


# kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.34.2/2025-11-13/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /usr/local/bin/kubectl
VALIDATE $? "kubectl installation"

# kubens
# git clone https://github.com/ahmetb/kubectx /opt/kubectx
# ln -s /opt/kubectx/kubens /usr/local/bin/kubens
# VALIDATE $? "kubens installation"


# Volume EBS driver
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.53"


# Volume EBS driver
kubectl kustomize \
    "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-2.X" > public-ecr-driver.yaml

#k9s install
curl -sS https://webinstall.dev/k9s | bash