export VERSION=v2.11.0
export FILENAME=helm-${VERSION}-linux-amd64.tar.gz
export HELM_URL=https://storage.googleapis.com/kubernetes-helm/${FILENAME}

curl -o /tmp/$FILENAME ${HELM_URL} \
  && tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp


RUN apk --update add git bash


helm init --client-only


mkdir /tmp
helm plugin install https://github.com/viglesiasce/helm-gcs.git
helm plugin install https://github.com/databus23/helm-diff