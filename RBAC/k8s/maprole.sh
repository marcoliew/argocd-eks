# kubectl edit -n kube-system configmap/aws-auth


...
  mapUsers: |
    - userarn: arn:aws:iam::424432388155:user/developer
      username: developer
      groups: 
      - reader
...
