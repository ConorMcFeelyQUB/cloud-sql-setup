set -x

STATIC_IP_NAME="static-sql-test"
MY_INSTANCE_NAME="my-app-instance-sql-test"
DB_INSTANCE_NAME="myinstance"
REGION=europe-west2
ZONE=europe-west2-a

#Creating a static IP for the vm
gcloud compute addresses create $STATIC_IP_NAME \
    --region $REGION \

#Storing the newly created static ip 
STATIC_IP_ONE="$(gcloud compute addresses describe $STATIC_IP_NAME --region $REGION --format='get(address)')"

echo "${STATIC_IP_ONE}"
echo "${STATIC_IP_ONE}"

#Add IP to authorised list for sql instance
gcloud --quiet sql instances patch $DB_INSTANCE_NAME --authorized-networks=81.156.184.236,35.192.28.53,104.154.37.156,34.66.4.217,"${STATIC_IP_ONE}",

#Creating the vm with static ip
gcloud compute instances create $MY_INSTANCE_NAME \
    --image-family=debian-9 \
    --image-project=debian-cloud \
    --machine-type=g1-small \
    --scopes userinfo-email,cloud-platform \
    --metadata-from-file startup-script=startup-script.sh \
    --zone $ZONE \
    --tags http-server \
    --address ${STATIC_IP_ONE}
