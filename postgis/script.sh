ns=postgre
kubectl create ns ${ns} -o yaml --dry-run=client | kubectl apply -f -
kubectl create secret generic pgcreds --from-env-file=.env -o yaml --dry-run=client | kubectl apply -f - -n ${ns}
kubectl apply -f statefulset.yaml -n ${ns}