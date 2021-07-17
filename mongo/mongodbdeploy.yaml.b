apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb
  namespace: mfpocns
spec:
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      volumes:
      - name: nfsdirectory
        persistentVolumeClaim:
          claimName: pvc-nfs-data    
      containers:
      - name: mongod-pod
        image: mongo
        ports:
          - containerPort: 27017
        volumeMounts:
        - name: nfsdirectory
          mountPath: "/data/db"
        env:
        - name: MONGO_INITDB_DATABASE
          valueFrom:
            configMapKeyRef:
              name: mongoconfig
              key: initdb
        - name: MONGO_INITDB_ROOT_USERNAME
          valueFrom:
            secretKeyRef:
              name: mongocredentials
              key: rootuser
        - name: MONGO_INITDB_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mongocredentials
              key: rootpswd
      imagePullSecrets:
      - name: dockcred
