# mongodb
Errors and solutions:

in case you get error in k logs for pod : Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.24/auth: dial unix /var/run/docker.sock: connect: permission denied
+then run command : sudo chmod 666 /var/run/docker.sock

Get base64:
echo -n mongo | base64

Install mongo to use nfs with credentials:

k apply -f common/mfpocns.yaml
k apply -f mongo/mongoconfig.yaml
k apply -f mongo/mongocredentials.yaml
k apply -f mongo/mongopv.yaml
k apply -f mongo/mongopvc.yaml
k apply -f mongo/mongodbdeploywithcred.yaml

Install mongo to use local
k apply -f common/mfpocns.yaml
k apply -f mongo/mongoconfig.yaml
k apply -f mongo/mongocredentials.yaml
k apply -f mongo/mongodbdeployhostpath.yaml



