
- az login
- az account list 
- az account list --output table
- az account set --subscription "My Demos"
- az group create --name benAKSGroup1 --location centralus 

- az aks create --resource-group benAKSGroup1 --name bkhub-cluster --node-count 1 --node-vm-size Standard_D1_v2 --dns-name-prefix benAKSGroup1 --kubernetes-version=1.8.1 --generate-ssh-keys 

- az aks get-credentials --resource-group benAKSGroup1 --name bkhub-cluster 
- az network public-ip create --name aksPublicIp  --resource-group MC_benAKSGroup1_bkhub-cluster_centralus  --allocation-method static
-  az network public-ip list --resource-group benAKSGroup1  --query [0].ipAddress --output tsv  

- az aks delete --name  bkhub-cluster --resource-group benAKSGroup1 --yes --no-wait

- az network dns zone create -n benAKSGroup1.com -g benAKSGroup1
- az network dns record-set a add-record \
--ipv4-address `az network public-ip create -g benAKSGroup1 \
-n nginxpubip3  --allocation-method static -o json| jq .publicIp.ipAddress` \
-z benAKSGroup1.com -g dns --record-set-name static -o json
