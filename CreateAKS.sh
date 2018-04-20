az login

az group create --name benAKSGroup1 --location centralus 

az aks create --resource-group benAKSGroup1 --name bkhub-cluster --node-count 1 --node-vm-size Standard_D1_v2 --dns-name-prefix benAKSGroup1 --kubernetes-version=1.8.1 --generate-ssh-keys 

az aks get-credentials --resource-group benAKSGroup1 --name bkhub-cluster 

az aks delete --name  bkhub-cluster --resource-group benAKSGroup1 --yes --no-wait