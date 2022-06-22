#!/bin/bash
for playbook in certificates.yml  kubeconfig.yml etcd.yml kube-control-plane.yml encryption.yml kube-node.yml k8-lb.yml apiserver-kubelet.yml network-dns.yml
do
ansible-playbook ${playbook} -i hosts.yml --ask-pass
done
