# ansible-ci-pipeline

This build provides a decent base for most Ansible pipelines and includes jq, boto3 and the AWS ansible collection for convenience.

## Include in pipelines like

```
  stage: configure
  image:
    name: dingus9/ansible-ci-pipeline:version-2.10.3
    entrypoint: ["/bin/sh", "-c"]
  script:
    - ansible-playbook example.yml
```

## To run and test stuff

```
docker -ti run dingus9/ansible-ci-pipeline:version-2.10.3 /bin/sh
```
