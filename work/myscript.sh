LABEL='kubevirt.io/domain=vm-k8s-master01'

POD=$(oc get pod -l ${LABEL} -o name)

echo ${POD}



oc expose ${POD} --name=vm-k8s-master01 --type=LoadBalancer --selector kubevirt.io/domain=vm-k8s-master01 --port=22 -o yaml --dry-run=client > vm-k8s-master01-service.yaml
